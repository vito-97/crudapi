<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\customer\curd\waterFetcher;

use app\customer\curd\Edit;

class WaterFetcherEdit extends Edit
{
    //显示的字段
    protected $field = ['money', 'flow', 'used_flow', 'invitation_code', 'spread_count', 'is_vip', 'pay_count'];
    protected $withoutField = true;
    //查询条件
    protected $where = [];
    //关联
    protected $with = [];
    //追加字段
    protected $append = [];
    //追加标签数据
    protected $labelCallback = [
        'get_status_enum'   => ['name' => '状态'],
        'get_platform_enum' => ['name' => '类型'],
        'get_sex_enum'      => ['name' => '性别'],
    ];
}