<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\device;

use app\waterworks\curd\Edit;

class DeviceRepairEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = ['device', 'user', 'repair_user'];
    //追加字段
    protected $append = [];
    //追加标签数据
    protected $labelCallback = [];
}