<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\adverts;

use app\agent\curd\Save;
use app\common\Enum;
use app\validate\AdvertsValidate;

class AdvertsSave extends Save
{
    //验证器
    protected $validate = [
        AdvertsValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = [];

    protected $withUser = true;
}