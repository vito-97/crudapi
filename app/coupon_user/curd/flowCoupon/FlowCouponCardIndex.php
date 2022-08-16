<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\coupon_user\curd\flowCoupon;

use app\common\curd\Index;
use app\common\Enum;
use app\validate\FlowCouponCardValidate;

class FlowCouponCardIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = [];
    //追加数据
    protected $appendCallback = [];
    //查询条件
    protected $where = [];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;

    protected $with = ['user','coupon'];

    protected $validate = [
        FlowCouponCardValidate::class => Enum::VALID_LIST_SCENE,
    ];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
    ];

    protected $queryField = [
        'coupon_id', 'user_id', 'status', 'is_use',
    ];
}