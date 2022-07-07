<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:27
 */

namespace app\model;


use app\model\traits\AgentTrait;
use app\model\traits\LoginTrait;
use \app\model\traits\RoleTrait;
use app\model\traits\UserScopeTrait;
use think\db\Query;

class User extends BaseModel
{
    use LoginTrait, RoleTrait, AgentTrait;

    use UserScopeTrait;

    const USER_TYPE = self::NORMAL_TYPE;

    protected $name = 'user';

    protected $hidden = ['password', 'delete_time'];

    protected $scene = [
        'api' => [
            'hidden' => ['password', 'delete_time', 'status', 'agent_id', 'role_id', 'mark', 'add_ip',],
        ],
    ];

    protected $type = [
        'birthday' => 'timestamp',
        'extend'   => 'json',
    ];

    /**
     * 全局查询范围
     * @var string[]
     */
    protected $globalScope = ['type'];

    const SEX_UNKNOWN = 0;
    const SEX_MALE = 1;
    const SEX_FEMALE = 2;

    protected $sexEnum = [
        self::SEX_UNKNOWN => '未知',
        self::SEX_MALE    => '男',
        self::SEX_FEMALE  => '女',
    ];

    protected $isVipEnum = self::SWITCH_ENUM;

    const H5_PLATFORM = 1;
    const WX_PLATFORM = 2;
    const ADD_PLATFORM = 9;

    protected $platformEnum = [
        self::H5_PLATFORM  => 'H5',
        self::WX_PLATFORM  => '微信',
        self::ADD_PLATFORM => '后台添加',
    ];

    //代理
    const AGENT_TYPE = 9;
    //普通取水用户
    const NORMAL_TYPE = 1;
    //水务公司
    const WATER_COMPANY_TYPE = 2;
    //水厂
    const WATERWORKS_TYPE = 3;
    //取水客户
    const CUSTOMER_TYPE = 4;
    //取水员
    const WATER_FETCHER_TYPE = 5;
    //维修人员
    const REPAIR_TYPE = 6;
    //优惠券管理员
    const COUPON_TYPE = 7;
    //出厂设置员
    const FACTORY_TYPE = 8;

    protected $typeEnum = [
        self::AGENT_TYPE         => '运营商',
        self::NORMAL_TYPE        => '普通用户',
        self::WATER_COMPANY_TYPE => '水务公司',
        self::WATERWORKS_TYPE    => '水厂',
        self::CUSTOMER_TYPE      => '取水客户',
        self::WATER_FETCHER_TYPE => '取水员',
        self::REPAIR_TYPE        => '维修人员',
        self::COUPON_TYPE        => '商户',
        self::FACTORY_TYPE       => '出厂设置员',
    ];

    /**
     * 是否被禁用
     * @return bool
     */
    public function isDisabled()
    {
        return $this->getData('status') == self::STATUS_OFF;
    }

    /**
     * 关联上级
     * @return \think\model\relation\BelongsTo
     */
    public function parent()
    {
        return $this->belongsTo('User')->field($this->userField ?? 'id,username,nickname,money,flow,pay_count,type,user_id');
    }

    /**
     * 将手机号设置成用户名
     * @param $value
     * @param $data
     * @return mixed
     */
    protected function setUsernameAttr($value, $data)
    {
        if (empty(trim($value))) {
            $value = $data['tel'];
        }

        return $value;
    }

    /**
     * 用户名模糊搜索
     * @param $query
     * @param $value
     * @return mixed
     */
    public function searchUsernameAttr(Query $query, $value)
    {
        return $query->whereLike('username', '%' . $value . '%', 'OR');
    }

    /**
     * 昵称模糊搜索
     * @param $query
     * @param $value
     * @return mixed
     */
    public function searchNicknameAttr($query, $value)
    {
        return $query->whereLike('nickname', '%' . $value . '%', 'OR');
    }

    /**
     * 搜索
     * @param Query $query
     * @param $value
     * @return Query
     */
    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('username|nickname|tel', 'like', '%' . $value . '%');
    }

    /**
     * 关联优惠券领取
     * @return \think\model\relation\HasMany
     */
    public function couponCard()
    {
        return $this->hasMany('CouponCard', 'user_id');
    }

    /**
     * 关联现金券领取
     * @return \think\model\relation\HasMany
     */
    public function cashCouponCard()
    {
        return $this->hasMany('CashCouponCard', 'user_id');
    }
}