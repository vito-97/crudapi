<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/12
 * Time: 10:43
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\common\EventName;
use think\facade\Event;

class User extends BaseController
{
    protected $name = '用户';

    protected $methodName = [
        'detail' => '详情',
    ];

    /**
     * 获取详情
     * @return array
     */
    public function detail()
    {
        $user = $this->getUserinfo()->scene('api');

        Event::trigger(EventName::GET_USER_DETAIL, $user);

        $response = [
            'detail' => $user,
        ];

        return success($response);
    }
}