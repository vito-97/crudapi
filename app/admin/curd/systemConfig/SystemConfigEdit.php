<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\systemConfig;

use app\common\curd\Edit;

class SystemConfigEdit extends Edit
{
    use SystemConfigTrait;

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
    protected $labelCallback = [];

    protected $middleware = [
        'queryMiddleware',
    ];
}