<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/2
 * Time: 16:43
 */

namespace app\model;


use app\model\traits\AgentTrait;
use app\model\traits\DeviceTrait;
use app\model\traits\OrderTrait;
use think\db\Query;

class ServiceCharge extends BaseModel
{
    use AgentTrait, DeviceTrait, OrderTrait;

    protected $type = [
        'time'     => 'timestamp',
        'pay_time' => 'timestamp',
        'expire_time' => 'timestamp',
    ];

    protected $append = [];

    protected $isPayEnum = self::SWITCH_ENUM;

    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('title', 'like', "%{$value}%");
    }
}