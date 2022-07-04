<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\device;

use app\waterworks\curd\Read;

class DeviceRead extends Read
{
    //需要展示的字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //追加输出的属性
    protected $append = ['adverts_light_desc', 'status_desc', 'state_desc'];
    protected $hidden = ['service_charge' => ['agent_id', 'device_id', 'delete_time']];
    //条件
    protected $where = [];
    //关联
    protected $with = ['service_charge'];
}