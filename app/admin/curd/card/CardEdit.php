<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\card;

use app\common\curd\Edit;

class CardEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = ['agent', 'user'];
    //追加字段
    protected $append = [];
    //追加数据回调
    protected $appendCallback = [];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
    ];
}
