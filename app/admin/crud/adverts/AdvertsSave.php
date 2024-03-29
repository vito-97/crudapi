<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\adverts;

use app\admin\crud\Save;
use app\validate\AdvertsValidate;

class AdvertsSave extends Save
{
    //验证器
    protected $validate = [
        AdvertsValidate::class => 'save',
    ];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = [];

    protected $withoutField = false;

    protected $withUser = 'admin_id';
}
