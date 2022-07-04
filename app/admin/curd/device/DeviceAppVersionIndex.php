<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\device;

use app\common\curd\Index;
use app\common\Enum;
use app\validate\DeviceAppVersionValidate;
use app\validate\DeviceValidate;

class DeviceAppVersionIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = ['index'];
    //追加数据
    protected $appendCallback = [];
    //查询条件
    protected $where = [];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;

    protected $validate = [
        DeviceAppVersionValidate::class => Enum::VALID_LIST_SCENE,
    ];

    protected $queryField = [
        'is_new', 'is_force', 'status',
    ];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
        'get_is_new_switch' => ['name' => '最新', 'key' => 'is_new'],
        'get_is_force_switch' => ['name' => '强制更新', 'key' => 'is_force'],
    ];
}