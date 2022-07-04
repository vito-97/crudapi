<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\attachment;

use app\waterworks\curd\Delete;

class AttachmentDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}