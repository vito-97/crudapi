<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\order;

use app\agent\curd\Change;
use think\Model;

class OrderChange extends Change
{
    use OrderTrait;

    //允许修改的字段
    protected $field = ['status', 'title', 'mark'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected function saveMiddleware($next, Model $model, array $params)
    {
        $response = $next($model, $params);

        $this->triggerOrderEvent($response);

        return $response;
    }
}