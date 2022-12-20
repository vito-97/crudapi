<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:28
 */

namespace app\model;

use app\common\Enum;
use app\model\traits\IpTrait;
use app\model\traits\UserTrait;
use think\db\Query;

class SystemLog extends BaseModel
{
    use UserTrait;
    use IpTrait;

    protected $moduleEnum = Enum::MODULE;

    protected $methodEnum = [
        'GET'    => 'GET',
        'POST'   => 'POST',
        'PUT'    => 'PUT',
        'DELETE' => 'DELETE',
    ];

    protected $append = [];

    protected $userField = 'id,username,nickname';

    /**
     * 关联管理员
     * @return \think\model\relation\BelongsTo
     */
    public function admin()
    {
        return $this->belongsTo('Admin', 'user_id')->field($this->adminField ?? 'id,username,nickname');
    }

    /**
     * 是否为后台模块
     * @return bool
     */
    public function isAdminModule()
    {
        return $this->getData('module') === 'admin';
    }

    /**
     * IP修改器
     * @param $value
     * @return false|int|mixed|string
     */
    public function setIpAttr($value)
    {
        return $this->_setIpAttr($value);
    }

    /**
     * IP获取器
     * @param $value
     * @return mixed|string
     */
    public function getIpAttr($value)
    {
        return $this->_getIpAttr($value);
    }

    /**
     * 列表搜索器
     * @param Query $query
     * @param $value
     * @return Query
     */
    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('title|url', 'like', '%' . $value . '%');
    }
}