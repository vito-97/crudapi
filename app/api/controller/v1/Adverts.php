<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/16
 * Time: 14:34
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\logic\AdvertsLogic;
use app\logic\DeviceLogic;
use app\validate\DeviceNoValidate;
use app\validate\ProductValidate;

class Adverts extends BaseController
{
    const NOT_NEED_LOGIN = ['index'];

    protected $name = '广告';

    protected $methodName = [
        'index' => '获取列表',
    ];

    protected function initialize()
    {
        $this->logic = new AdvertsLogic();
    }

    public function index($deviceNo = '', $agentId = 0)
    {
        if (!$agentId) {
            DeviceNoValidate::batchCheck();
        }
        $where  = [];
        $device = null;
        if ($deviceNo) {
            $deviceLogic       = new DeviceLogic();
            $device            = $deviceLogic->getByDeviceNo($deviceNo);
            $where['agent_id'] = $device->agent_id;
        } elseif ($agentId) {
            $where['agent_id'] = $agentId;
        }

        $list = $this->logic->getAll(['where' => $where, 'scope' => ['status'], 'field' => ['id', 'title', 'image', 'link']])->append([]);

        $data = ['list' => $list];

        return success($data);
    }
}
