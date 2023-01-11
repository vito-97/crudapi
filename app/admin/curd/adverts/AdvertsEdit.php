<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\adverts;

use app\admin\curd\Edit;

class AdvertsEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = ['admin'];
    //追加字段
    protected $append = [];
    //追加数据回调
    protected $appendCallback = [];
    protected $labelCallback = ['get_status_enum' => ['name' => '状态', 'key' => 'status']];
}
