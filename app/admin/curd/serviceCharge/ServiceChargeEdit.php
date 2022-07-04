<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\serviceCharge;

use app\common\curd\Edit;

class ServiceChargeEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = ['agent'];
    //追加字段
    protected $append = [];
    //追加标签数据
    protected $labelCallback = [];
}