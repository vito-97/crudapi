<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\adverts;

use app\agent\curd\Edit;

class AdvertsEdit extends Edit
{
    //字段
    protected $field = ['agent_id'];
    //排除字段
    protected $withoutField = true;
    //查询条件
    protected $where = [];
    //关联
    protected $with = [];
    //追加字段
    protected $append = [];
    //追加标签数据
    protected $labelCallback = [
        'get_status_enum'       => ['name' => '状态'],
    ];
}