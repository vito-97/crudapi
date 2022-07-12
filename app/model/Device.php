<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:29
 */

namespace app\model;


use app\common\Message;
use app\model\traits\AgentTrait;
use app\model\traits\DisabledTrait;
use app\model\traits\SiteScopeTrait;
use app\model\traits\UserTrait;
use think\db\Query;
use think\Model;

class Device extends BaseModel
{
    use AgentTrait;
    use DisabledTrait;
    use SiteScopeTrait;

    protected $type = [
        'start_time' => 'timestamp',
    ];

    const STATUS_FAULT = 2;

    //消息的字段
    const TIP_FIELD = ['tip1', 'tip2', 'tip3', 'tip4'];

    //场景
    protected $scene = [
        'api' => [
            'hidden' => ['used_flow', 'agent_id', 'used_global_product', 'mark', 'delete_time'],
        ],
    ];

    protected $advertsLightEnum = [
        self::SWITCH_ON  => '开',
        self::SWITCH_OFF => '关',
    ];

    protected $statusEnum = [
        self::STATUS_OFF   => Message::STATUS_OFF,
        self::STATUS_ON    => Message::STATUS_ON,
        self::STATUS_FAULT => Message::STATUS_FAULT,
    ];

    //屏幕类型
    const SCREEN_TYPE = 1;
    //简易类型
    const EASY_TYPE = 2;

    protected $typeEnum = [
        self::SCREEN_TYPE => '屏幕',
        self::EASY_TYPE   => '简易',
    ];

    const FREE_STATE = 0;
    const WAIT_STATE = DeviceControl::STATE_WAIT;
    const START_STATE = DeviceControl::STATE_START;
    const PAUSE_STATE = DeviceControl::STATE_PAUSE;
    const FINISH_STATE = DeviceControl::STATE_FINISH;


    protected $stateEnum = [
        self::FREE_STATE   => '空闲',
        self::WAIT_STATE   => '待加注',
        self::START_STATE  => '加注中',
        self::PAUSE_STATE  => '暂停中',
        self::FINISH_STATE => '空闲',
    ];

    protected $hidden = ['tip', 'delete_time'];

    public function isFaultStatus()
    {
        return self::STATUS_FAULT == $this->getData('status');
    }

    public static function onBeforeInsert(Model $model)
    {
        if (empty($model->device_no)) {
            $maxID = self::max('id');

            $model->device_no = str_pad($maxID + 1, '6', '0', STR_PAD_LEFT);
        }
    }

    public static function onAfterInsert(Model $model): void
    {
        $device_no = str_pad($model->id, '6', '0', STR_PAD_LEFT);

        if (empty($model->device_no) || $device_no != $model->device_no) {
            $model->device_no = str_pad($model->id, '6', '0', STR_PAD_LEFT);

            $model->save();
        }
    }

    /**
     * 关联设备提示信息
     * @return \think\model\relation\HasOne
     */
    public function tip()
    {
        return $this->hasOne('DeviceTip')->bind(self::TIP_FIELD);
    }

    /**
     * 关联报修记录
     * @return \think\model\relation\HasMany
     */
    public function repair()
    {
        return $this->hasMany('DeviceRepair')->withTrashed();
    }

    public function deviceControl()
    {
        return $this->hasMany('DeviceControl');
    }

    /**
     * 关联服务费列表
     * @return \think\model\relation\HasMany
     */
    public function serviceChargeList()
    {
        return $this->hasMany('ServiceCharge');
    }

    /**
     * 关联服务费
     * @return \think\model\relation\HasOne
     */
    public function serviceCharge()
    {
        return $this->hasOne('ServiceCharge')->where('is_pay', self::SWITCH_OFF);
    }

    /**
     * 搜索列表
     * @param Query $query
     * @param $value
     */
    public function searchIndexAttr(Query $query, $value)
    {
        $query->where('name|device_no', 'like', "%{$value}%");
    }

    /*    public function useStatus()
        {
            return $this->hasOne('DeviceControl')->order('id', 'DESC')->bind(['state']);
        }*/

    /**
     * 获取二维码链接
     * @param $value
     * @param $data
     * @return string
     */
    protected function getQrcodeUrlAttr($value, $data)
    {
        return config('web.short_host') . $data['device_no'];
    }

    protected function getAdvertsLightDescAttr($value, $data)
    {
        return $this->getEnumDesc('adverts_light', $data);
    }

    protected function getPhoneAttr()
    {
        return Agent::where('id', $this->agent_id)->cache(60)->value('phone');
    }

    /**
     * 上线否是否需要设置
     * @param $value
     * @param $data
     * @return bool
     */
    protected function getOnlineSettingAttr($value, $data)
    {
        return in_array($data['type'], [1]);
    }

    /**
     * 获取设备状态
     * @param $value
     * @param $data
     * @return array|mixed|string
     */
    protected function getStateDescAttr($value, $data)
    {
        $desc = $this->getEnumDesc('state', $data);

        if (is_integer($desc)) {
            $desc = $this->stateEnum[self::FREE_STATE];
        }

        return $desc;
    }
}