<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:36
 */

namespace app\logic;


use app\exception\DataNotFoundException;
use app\model\Device;
use app\model\Member;
use app\model\Product;

class ProductLogic extends BaseLogic
{
    protected function getModelName()
    {
        return Product::class;
    }

    public function getProductByID($id)
    {
        $detail = $this->getByID($id, ['scope' => ['status']]);

        if (!$detail) {
            throw new DataNotFoundException('套餐不存在');
        }

        return $detail;
    }

    /**
     * 通过设备去获取套餐
     * 没有传入设备则获取全局
     * @param null|object $device
     * @return \app\model\BaseModel|\app\model\BaseModel[]|array|\think\Collection|\think\Paginator
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getProductByDevice($device = null, $vip = 0)
    {
//        $deviceID = [0];
//        $agentID  = [0];
        $agentID = [];
        if ($device) {
            if ($device->used_global_product) {
                $deviceID[] = $device->id;
            } else {
                $deviceID = [$device->id];
            }

            $user = Member::cache(60)->find($device->agent_id);

            //水厂则取上级水务公司
            if ($user->type === Member::WATERWORKS_TYPE) {
                $user = Member::cache(60)->find($user->user_id);
            }

            if (!$user->isEmpty()) {
                $type      = $user->product_type;
                $agentID[] = $user->id;
            } else {
                $type      = $device->type == Device::SCREEN_TYPE ? Product::FLOW_TYPE : Product::TIME_TYPE;
                $agentID[] = $device->agent_id;
            }
        }

        $productLogic = new ProductLogic();
        $args         = [
            'where'    => [
                'is_vip'   => $vip ? 1 : 0,
                'agent_id' => $agentID,
                'type'     => $type,
            ], 'scope' => ['status']];
        $result       = $productLogic->getAll($args);

        return $result;
    }
}
