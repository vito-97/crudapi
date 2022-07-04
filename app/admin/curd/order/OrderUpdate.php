<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\order;

use app\common\curd\Update;
use app\common\Enum;
use app\validate\OrderValidate;
use think\Model;

class OrderUpdate extends Update
{
    use OrderTrait;

    //验证器
    protected $validate = [
        OrderValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = ['title', 'status', 'mark'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected $saveMiddleware = ['saveMiddleware'];

    protected function saveMiddleware($next, Model $model,array $params)
    {
        $response = $next($model,$params);

        //触发支付事件
        $this->triggerOrderEvent($response);

        return $response;
    }
}