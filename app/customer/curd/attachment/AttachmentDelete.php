<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\customer\curd\attachment;

use app\customer\curd\Delete;

class AttachmentDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}