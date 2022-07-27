<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/9
 * Time: 14:14
 */

namespace app\model\traits;


trait DeviceTrait
{
    public function device()
    {
        return $this->belongsTo('Device')->field($this->deviceField ?? 'id,name,device_no,imei,status,site_id,disabled,type');
    }
}
