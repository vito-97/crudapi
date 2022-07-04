<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\card;

use app\common\curd\Save;
use app\validate\CardValidate;

class CardSave extends Save
{
    //验证器
    protected $validate = [
        CardValidate::class => 'save'
    ];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = ['money','use_time'];

    protected $withoutField = true;
}