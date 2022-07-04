<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\systemConfig;

use app\common\curd\Edit;

class SystemConfigTabEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = [];
    //追加字段
    protected $append = [];
    //追加数据
    protected $appendCallback = [];
    //追加标签数据
    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态'],
        'get_is_show_switch' => ['name' => '显示配置页'],
        'parent' => ['name' => '父类', 'key' => 'parent', 'field' => 'pid'],
    ];

    public function parent()
    {
        return $this->getLogic()->getLabel();
    }
}