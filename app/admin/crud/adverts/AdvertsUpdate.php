<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\adverts;

use app\admin\crud\Update;
use app\common\Enum;
use app\validate\AdvertsValidate;

class AdvertsUpdate extends Update
{
    //验证器
    protected $validate = [
        AdvertsValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = [];
    //获取对象时追加的字段
    protected $appendField = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected $withUser = 'admin_id';
}
