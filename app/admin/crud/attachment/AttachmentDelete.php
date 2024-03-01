<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\attachment;

use app\admin\crud\Delete;

class AttachmentDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
