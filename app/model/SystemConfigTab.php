<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/19
 * Time: 10:58
 */

namespace app\model;


use think\db\Query;

class SystemConfigTab extends BaseModel
{
    /**
     * 关联所有子类
     * @return \think\model\relation\HasMany
     */
    public function child()
    {
        return $this->hasMany('SystemConfigTab', 'pid', 'id')->with(['child']);
    }

    /**
     * 关联下级子类
     * @return \think\model\relation\HasMany
     */
    public function sub()
    {
        return $this->hasMany('SystemConfigTab', 'pid', 'id');
    }

    /**
     * 关联父类
     * @return \think\model\relation\BelongsTo
     */
    public function parent()
    {
        return $this->belongsTo('SystemConfigTab', 'pid', 'id');
    }

    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('title', 'like', "%{$value}%");
    }
}