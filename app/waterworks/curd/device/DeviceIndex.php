<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\device;

use app\waterworks\curd\Index;
use app\common\Enum;
use app\validate\DeviceValidate;

class DeviceIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = ['index'];
    protected $hidden = ['service_charge' => ['agent_id', 'device_id', 'delete_time']];
    //查询条件
    protected $where = [];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //关联
    protected $with = ['service_charge'];

    protected $append = ['adverts_light_desc', 'status_desc', 'state_desc'];
    /**
     * 需要查询条件的字段
     * 数据库字段和参数字段名不一样 'db_field' => 'param_field'
     * 数据库字段和参数字段名一样 'field'
     * @var array
     */
    protected $queryField = [
        'agent_id', 'status',
    ];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
        'get_state_enum'  => ['name' => '使用状态', 'key' => 'state'],
    ];

    protected $validate = [
        DeviceValidate::class => Enum::VALID_LIST_SCENE,
    ];
}