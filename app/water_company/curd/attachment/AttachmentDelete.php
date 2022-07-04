<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\attachment;

use app\water_company\curd\Delete;

class AttachmentDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}