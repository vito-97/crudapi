<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\contract;

use app\water_company\curd\Edit;

class ContractEdit extends Edit
{
    //显示的字段
    protected $field = [];
    //查询条件
    protected $where = [];
    //关联
    protected $with = ['customer'];
    //追加字段
    protected $append = [];
    //追加标签数据
    protected $labelCallback = [];
}