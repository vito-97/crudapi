<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:27
 */

namespace app\model;

use app\model\traits\AvatarAttrTrait;
use app\model\traits\LoginTrait;
use app\model\traits\RoleTrait;
use app\model\traits\UserScopeTrait;
use think\db\Query;

class User extends BaseModel
{
    use LoginTrait, RoleTrait;

    use UserScopeTrait;

    use AvatarAttrTrait;

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
    //普通取水用户
    const NORMAL_TYPE = 1;

    protected $typeEnum = [
        self::NORMAL_TYPE        => '普通用户',
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
        return $this->belongsTo('User')->field($this->userField ?? 'id,username,nickname,money,expire_time,pay_count,type,user_id');
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
     * 设置过期时间
     * @param $second
     */
    public function setExpireTime($second)
    {
        $expireTime = $this->expire_time;
        $time       = time();
        if ($expireTime > $time) {
            $this->expire_time += $second;
        } else {
            $this->expire_time = $time + $second;
        }
    }
}
