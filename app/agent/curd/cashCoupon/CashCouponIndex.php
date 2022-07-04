<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\cashCoupon;

use app\agent\curd\Index;
use app\common\Enum;
use app\validate\CouponValidate;

class CashCouponIndex extends Index
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
    protected $field = ['agent_id', 'product_id'];
    //排除字段
    protected $withoutField = true;

    protected $with = ['coupon_user'];

    protected $scope = ['sort'];

    protected $order = ['id' => 'desc'];

    protected $queryField = [
        'status', 'coupon_user_id', 'is_infinite', 'limit_type',
    ];

    protected $labelCallback = [
        'get_status_enum'     => ['name' => '状态', 'key' => 'status'],
        'get_limit_type_enum' => ['name' => '限制领取类型', 'key' => 'limit_type'],
    ];

    protected $hidden = ['full_minus', 'type', 'delete_time'];

    protected $validate = [
        CouponValidate::class => Enum::VALID_LIST_SCENE,
    ];
}