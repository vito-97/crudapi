<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/20
 * Time: 14:42
 */

namespace app\api\controller\v1;

use app\api\controller\BaseController;
use app\common\ErrorCode;
use app\common\EventName;
use app\common\Util;
use app\exception\MessageException;
use app\logic\AgentLogic;
use app\logic\SystemConfigLogic;
use app\logic\UserLogic;
use app\logic\UserOauthLogic;
use app\model\UserOauth;
use app\service\RedisStoreService;
use app\service\TokenService;
use app\service\WechatService;
use app\validate\WechatOauthValidate;
use EasyWeChat\Kernel\Messages\Message;
use EasyWeChat\Kernel\Messages\News;
use EasyWeChat\Kernel\Messages\NewsItem;
use Overtrue\Socialite\Exceptions\AuthorizeFailedException;
use think\facade\Db;
use think\facade\Event;
use think\facade\Log;
use think\helper\Str;

class Wechat extends BaseController
{
    const NOT_NEED_LOGIN = ['api'];

    protected $methodName = [
        'index'    => '微信接口',
        'login'    => '授权登录',
        'callback' => '授权登录回调',
    ];

    /**
     * @var WechatService
     */
    protected $wechat;

    protected $message = [];

    protected $openid;
    protected $toUser;

    public function index()
    {
        $this->wechat = $wechat = new WechatService();

        $this->message = $wechat->server->getMessage();
        $this->openid  = $this->message['FromUserName'] ?? '';
        $this->toUser  = $this->message['ToUserName'] ?? '';
        $wechat->server->push([$this, 'event'], Message::EVENT);

        $response = $wechat->server->serve();
        $response->send();

        if (is_dev()) {
            die;
        }

        return '';
    }

    public function callback($code = '', $state = '')
    {
        WechatOauthValidate::batchCheck(['code' => $code], 'code');

        try {
            $cache = new RedisStoreService();

            if ($cache->has($code)) {
                $attribute = $cache->get($code);
                $user      = new \Overtrue\Socialite\User(unserialize($attribute));
            } else {
                $this->wechat = $wechat = new WechatService();
                $user         = $wechat->oauth->userFromCode($code);
                $attribute    = $user->serialize();
                // 缓存授权信息
                $cache->set($code, $attribute, is_dev() ? 86400 : 60);
            }


            $id         = $user->getId();
            $nickname   = $user->getNickname();
            $avatar     = $user->getAvatar();
            $oauthLogic = new UserOauthLogic();

            $oauth = $oauthLogic->getModel()->where('openid', $id)->where('type', UserOauth::TYPE_WECHAT)->find();

            if (!$oauth) {
                Db::startTrans();
                try {
                    $userinfo = $this->register($nickname, $avatar);

                    $oauth = $oauthLogic->getModel()->add([
                        'openid'   => $id,
                        'nickname' => $nickname,
                        'avatar'   => $avatar,
                        'user_id'  => $userinfo->id,
                        'type'     => UserOauth::TYPE_WECHAT,
                    ]);

                    if ($oauth) {
                        Db::commit();
                    } else {
                        Db::rollback();
                        throw new MessageException('授权登录失败');
                    }

                } catch (\Exception $e) {
                    Db::rollback();

                    Log::write("微信授权登录失败：" . $e->getMessage());

                    throw new MessageException('授权登录失败');
                }

            } else {
                $userinfo = $oauth->user;

                if (!$userinfo) {
                    $userinfo       = $this->register($nickname, $avatar);
                    $oauth->user_id = $userinfo->id;
                    $oauth->save();
                }
            }

            Event::trigger(EventName::USER_LOGIN, ['user' => $userinfo, 'type' => TokenService::USER]);
            return $this->success($userinfo);

        } catch (AuthorizeFailedException $e) {
            return $this->error(ErrorCode::PARAM_ERROR, '错误的授权码');
        }
    }

    public function login($type = 'userinfo')
    {
        WechatOauthValidate::batchCheck(['scope' => $type], 'scope');

        $this->wechat = $wechat = new WechatService();

        $callback = web('client_host') . 'pages/oauth/wechat';

        $redirectUrl = $wechat->oauth->scopes(['snsapi_' . $type])
            ->redirect($callback);

        return $this->success(['url' => $redirectUrl]);
    }

    /**
     * 事件
     * @param $message
     */
    public function event($message)
    {

        $event    = $message['Event'];
        $eventKey = $message['EventKey'] ? $message['EventKey'] : $message['Event'];

        if (in_array($event, ['subscribe', 'SCAN'])) {
            //扫码注册维护员二维码
            if (preg_match("/repair_register_(\d*?)$/", $eventKey, $matches)) {
                [, $agentID] = $matches;

                return $this->repairRegister($agentID);
            }
        }

    }

    /**
     * 响应运营商注册维护员链接
     * @param $agentID
     * @return News|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function repairRegister($agentID)
    {
        $logic = new AgentLogic();
        $agent = $logic->getByID($agentID);
        if (!$agent) {
            return '找不到相关运营商';
        }

        if ($agent->isDisabled()) {
            return '运营商已下线';
        }

        $items = [
            new NewsItem([
                'title'       => '注册[' . $agent->nickname . ']的维护员',
                'description' => '点击进入注册',
                'url'         => web('repair_host') . web('repair_register_uri') . '?' . http_build_query(['agent_id' => $agentID]),
                'image'       => Util::link(SystemConfigLogic::get('wechat_share_img')),
            ]),
        ];

        return new News($items);
    }

    protected function register($nickname, $avatar = '')
    {
        $userLogic = new UserLogic();
//        $nickname  = trim_emoji($nickname);
        if (!$nickname) {
            $nickname = '微信授权';
        }

        $userinfo = $userLogic->register([
            'username' => 'oauth_' . Str::random(10),
            'nickname' => $nickname . Str::random(5),
            'password' => 'a123456.',
            'avatar'   => $avatar,
            'money'    => 0,
            'flow'     => 0,
            'add_ip'   => $this->request->ip(),
            'platform' => \app\model\User::WX_PLATFORM,
        ]);

        return $userinfo;
    }
}
