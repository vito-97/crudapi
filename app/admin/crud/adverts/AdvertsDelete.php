<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\adverts;

use app\admin\crud\Delete;

class AdvertsDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}
