<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\contract;

use app\water_company\curd\Delete;

class ContractDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}