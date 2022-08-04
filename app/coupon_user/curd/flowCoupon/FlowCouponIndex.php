<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\coupon_user\curd\flowCoupon;

use app\common\curd\Index;
use app\common\Enum;
use app\validate\FlowCouponValidate;

class FlowCouponIndex extends Index
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
    protected $withoutField = true;

    protected $with = ['coupon_user'];

    protected $scope = ['sort'];

    protected $order = ['id' => 'desc'];

    protected $queryField = [
        'status', 'coupon_user_id', 'is_infinite', 'limit_type',
    ];

    protected $hidden = ['full_minus', 'type', 'delete_time'];

    protected $labelCallback = [
        'get_status_enum'     => ['name' => '状态', 'key' => 'status'],
        'get_limit_type_enum' => ['name' => '限制领取类型', 'key' => 'limit_type'],
    ];

    protected $validate = [
        FlowCouponValidate::class => Enum::VALID_LIST_SCENE,
    ];
}
