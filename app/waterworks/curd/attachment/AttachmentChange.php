<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\attachment;

use app\waterworks\curd\Change;

class AttachmentChange extends Change
{
    //允许修改的字段
    protected $field = [
        'category', 'width', 'height',
    ];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}