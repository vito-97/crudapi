<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\repair_user\curd\device;

use app\repair_user\curd\Update;
use app\common\Enum;
use app\validate\DeviceRepairValidate;

class DeviceRepairUpdate extends Update
{
    //验证器
    protected $validate = [
        DeviceRepairValidate::class => Enum::VALID_UPDATE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = ['title', 'content', 'device_id', 'status', 'user_id', 'repair_user_id'];
    //获取对象时追加的字段
    protected $appendField = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}