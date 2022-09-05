<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\repair_user\curd\device;

use app\repair_user\curd\Read;

class DeviceRead extends Read
{
    //需要展示的字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //追加输出的属性
    protected $append = ['adverts_light_desc', 'status_desc', 'state_desc'];
    protected $hidden = [];
    //条件
    protected $where = [];
    //关联
    protected $with = ['tip'];
}
