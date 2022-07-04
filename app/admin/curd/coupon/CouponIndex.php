<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\coupon;

use app\common\curd\Index;
use app\common\Enum;
use app\validate\CouponValidate;

class CouponIndex extends Index
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

    protected $with = ['product', 'coupon_user'];

    protected $scope = ['sort'];

    protected $order = ['id' => 'desc'];

    protected $queryField = [
        'product_id', 'status', 'coupon_user_id', 'limit_type',
    ];

    protected $labelCallback = [
        'get_status_enum'     => ['name' => '状态', 'key' => 'status'],
        'get_limit_type_enum' => ['name' => '限制领取类型', 'key' => 'limit_type'],
    ];

    protected $validate = [
        CouponValidate::class => Enum::VALID_LIST_SCENE,
    ];
}