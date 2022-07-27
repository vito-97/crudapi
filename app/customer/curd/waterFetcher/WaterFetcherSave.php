<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\customer\curd\waterFetcher;

use app\common\Enum;
use app\customer\curd\Save;
use app\exception\MessageException;
use app\model\User;
use app\validate\WaterFetcherValidate;

class WaterFetcherSave extends Save
{
    //验证器
    protected $validate = [
        WaterFetcherValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = ['username' => '', 'platform' => User::ADD_PLATFORM];
    //允许新增的数据字段
    protected $field = ['agent_id', 'type', 'platform', 'money'];
    protected $withoutField = true;
    protected $withUser = true;

    protected function saveMiddleware($next, $params)
    {
        $params['add_ip'] = $this->request->ip();
        $params['type']   = User::WATER_FETCHER_TYPE;

        if (!empty($params['flow'])) {
            $user = $this->user->getUserInfo();

            if (!$user->flow) {
                $msg = '你当前没有剩余流量可以分配';
                throw new MessageException(['message' => $msg, 'data' => ['flow' => $msg]]);
            }

            if ($params['flow'] > $user->flow) {
                $msg = '分配的流量不能大于' . $user->flow . 'L';
                throw new MessageException(['message' => $msg, 'data' => ['flow' => $msg]]);
            }

            //减少取水客户的流量
            $user->flow = ['dec', $params['flow']];
            $user->save();
        }

        return $next($params);
    }
}
