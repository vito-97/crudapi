<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\pay;

use app\common\curd\Edit;

class AllInPayEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = ['agent'];
    //追加字段
    protected $append = [];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
    ];
}