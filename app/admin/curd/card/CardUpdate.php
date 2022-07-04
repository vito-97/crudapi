<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\card;

use app\common\curd\Update;
use app\common\Enum;
use app\validate\CardValidate;

class CardUpdate extends Update
{
    //验证器
    protected $validate = [
        CardValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = ['money', 'use_time'];
    protected $withoutField = true;
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}