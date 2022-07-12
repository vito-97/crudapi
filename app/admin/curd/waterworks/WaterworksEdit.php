<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\waterworks;

use app\common\curd\Edit;

class WaterworksEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = ['water_company'];
    //追加字段
    protected $append = [];
    //追加标签数据
    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态'],
        'get_sex_enum'    => ['name' => '性别'],
    ];
}