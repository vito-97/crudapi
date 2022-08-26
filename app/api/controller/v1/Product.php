<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/8
 * Time: 10:17
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\logic\DeviceLogic;
use app\logic\ProductLogic;
use app\validate\DeviceNoValidate;

class Product extends BaseController
{
    protected $name = '套餐';

    protected $methodName = [
        'index' => '详情',
    ];

    protected function initialize()
    {
        $this->logic = new ProductLogic();
    }

    /**
     * 获取套餐列表
     * @param string $deviceNo
     * @return array
     * @throws \app\exception\DataNotFoundException
     * @throws \app\exception\ValidateException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function index($deviceNo = '')
    {
        DeviceNoValidate::batchCheck();

        $device = null;
        if ($deviceNo) {
            $deviceLogic = new DeviceLogic();
            $device      = $deviceLogic->getByDeviceNo($deviceNo);
        }

        $user    = $this->getUserinfo();
        $vip     = $user ? $user->is_vip : false;
        $product = $this->logic->getProductByDevice($device, $vip);

        $data = ['list' => $product];

        return success($data);
    }
}
