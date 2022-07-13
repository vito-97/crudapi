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
use app\model\traits\SiteScopeTrait;
use think\db\Query;
use think\facade\Request;
use think\Model;

class Admin extends BaseModel
{
    use LoginTrait, RoleTrait;
    use SiteScopeTrait;
    use AvatarAttrTrait;

    protected $hidden = ['password', 'delete_time'];

    protected $readonly = ['add_ip'];


    /**
     * 是否被禁用
     * @return bool
     */
    public function isDisabled()
    {
        return $this->getData('status') == self::STATUS_OFF;
    }

    /**
     * 在插入之前事件
     * @param Model $model
     * @return mixed|void
     */
    public static function onBeforeInsert(Model $model)
    {
        //自动写入添加IP
        $model->add_ip = Request::ip();
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
     * 搜索列表时的模糊搜索条件
     * @param Query $query
     * @param $value
     * @return Query
     */
    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('nickname|username', 'like', '%' . $value . '%');
    }
}