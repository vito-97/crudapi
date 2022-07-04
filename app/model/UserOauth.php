<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/19
 * Time: 10:57
 */

namespace app\model;


use app\model\traits\UserTrait;
use think\db\Query;

class UserOauth extends BaseModel
{
    use UserTrait;

    const TYPE_WECHAT = 1;
    const TYPE_MINI_WECHAT = 2;

    protected $typeEnum = [
        self::TYPE_WECHAT => '微信',
        self::TYPE_MINI_WECHAT => '微信小程序'
    ];

    const SEX_UNKNOWN = 0;
    const SEX_MALE = 1;
    const SEX_FEMALE = 2;

    protected $sexEnum = [
        self::SEX_UNKNOWN => '未知',
        self::SEX_MALE => '男',
        self::SEX_FEMALE => '女',
    ];

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
     * 列表搜索
     * @param Query $query
     * @param $value
     * @return Query
     */
    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('nickname', 'like', '%' . $value . '%');
    }
}