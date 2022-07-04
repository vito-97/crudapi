<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\product;

use app\agent\curd\Change;

class ProductChange extends Change
{
    //允许修改的字段
    protected $field = ['status', 'mark', 'is_vip','allow_refund'];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}