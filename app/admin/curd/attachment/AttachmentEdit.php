<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\attachment;

use app\admin\curd\Edit;

class AttachmentEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = [];
    //追加字段
    protected $append = [
        'link',
    ];
    //追加标签数据
    protected $labelCallback = [
        'get_category_enum' => ['name' => '分类', 'key' => 'category'],
    ];
}
