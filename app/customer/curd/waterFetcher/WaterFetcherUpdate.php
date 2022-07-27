<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\customer\curd\waterFetcher;

use app\common\Enum;
use app\customer\curd\Update;
use app\exception\MessageException;
use app\validate\WaterFetcherValidate;
use think\Model;

class WaterFetcherUpdate extends Update
{
    //验证器
    protected $validate = [
        WaterFetcherValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = ['agent_id', 'type', 'platform', 'money', 'flow'];
    protected $withoutField = true;
    //获取对象时追加的字段
    protected $appendField = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected function saveMiddleware($next, Model $model, array $params)
    {
        if (!empty($params['update_flow'])) {
            $user = $this->user->getUserInfo();

            $updateFlow = $params['update_flow'];

            if ($updateFlow > 0) {
                if (!$user->flow) {
                    $msg = '你当前没有剩余流量可以分配';
                    throw new MessageException(['message' => $msg, 'data' => ['update_flow' => $msg]]);
                }

                if ($updateFlow > $user->flow) {
                    $msg = '分配的流量不能大于' . $user->flow . 'L';
                    throw new MessageException(['message' => $msg, 'data' => ['update_flow' => $msg]]);
                }

                //减少取水客户的流量
                $user->flow = ['dec', $updateFlow];
                //追加给取水员的流量
                $model->flow = ['inc', $updateFlow];
            } else {
                $n = abs($updateFlow);

                if (!$model->flow) {
                    $msg = "[{$model->nickname}]当前没有剩余流量可以回收";
                    throw new MessageException(['message' => $msg, 'data' => ['update_flow' => $msg]]);
                }

                if ($n > $model->flow) {
                    $msg = '回收的流量不能大于' . $model->flow . 'L';
                    throw new MessageException(['message' => $msg, 'data' => ['update_flow' => $msg]]);
                }

                $user->flow = ['inc', $n];
                //回收给取水员的流量
                $model->flow = ['dec', $n];
            }

            $user->save();
        }

        return parent::saveMiddleware($next, $model, $params); // TODO: Change the autogenerated stub
    }
}
