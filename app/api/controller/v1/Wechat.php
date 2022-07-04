<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/20
 * Time: 14:42
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\common\Util;
use app\logic\AgentLogic;
use app\model\Agent;
use app\service\WechatService;
use EasyWeChat\Kernel\Messages\Message;
use EasyWeChat\Kernel\Messages\News;
use EasyWeChat\Kernel\Messages\NewsItem;

class Wechat extends BaseController
{
    const NOT_NEED_LOGIN = ['api'];

    protected $methodName = [
        'index' => '微信接口',
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
                'image'       => Util::link(site('wechat.cover')),
            ]),
        ];

        return new News($items);
    }
}