<?php
/**
 * Created by Commend.
 * User: Vito
 */

namespace app\validate;

use app\validate\traits\PositionTrait;

class DeviceValidate extends BaseValidate
{
    use PositionTrait;

    /**
     * 验证规则
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name|valid_field.name 或 name|name_alias 或 name
     * @var array
     */
    protected $rule = [
        'name'                => 'max:50',
        'device_no'           => 'alphaNum|max:10|unique:device',
        'imei'                => 'require|alphaNum|max:30|unique:device',
        'status'              => 'require|checkEnum',
        'lat'                 => 'checkLat',
        'lng'                 => 'checkLng',
        'l_to_pulse'          => 'isPositiveInteger:zero',
        'agent_id'            => 'checkHas:agent/waterworks',
        'used_global_product' => 'checkSwitch',
        'address'             => 'requireWith:lat|max:120',
        'adverts_light'       => 'checkSwitch',
        'mark'                => 'max:120',
        'product_type'        => 'require|checkEnum',
    ];

    /**
     * 字段对应的名称
     * 可设置语言包字段 语言包分组为valid_field
     * 例如 name => valid_field.name 或 name => name_alias
     * @var array
     */
    protected $field = [

    ];

    /**
     * 验证消息
     * 可设置语言包字段 无分组
     * @var array
     */
    protected $message = [

    ];

    /**
     * 验证场景
     * @var array
     */
    protected $scene = [
        self::SAVE_SCENE   => 'all',
        self::UPDATE_SCENE => 'all',
        self::LIST_SCENE   => ['status', 'agent_id'],
    ];

    /**
     * 操作场景
     * @return DeviceValidate
     */
    public function sceneControl()
    {
        return $this->only(['device_no'])->remove('device_no', 'unique');
    }

    public function sceneDevice()
    {
        return $this->only(['device_no'])->remove('device_no', 'unique');
    }

    public function sceneBind()
    {
        return $this->only(['imei'])->remove('imei', 'unique');
    }
}
