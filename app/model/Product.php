<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:30
 */

namespace app\model;


use app\model\traits\AgentTrait;
use think\db\Query;

class Product extends BaseModel
{
    use AgentTrait;

    const FLOW_TYPE = 1;

    const TIME_TYPE = 2;

    protected $hidden = ['update_time', 'delete_time'];

    protected $isVipEnum = self::SWITCH_ENUM;

    const TYPE_ENUM = [
        self::FLOW_TYPE => '流量计费',
        self::TIME_TYPE => '按时计费',
    ];

    protected $typeEnum = self::TYPE_ENUM;

    /**
     * 递增购买统计
     * @return $this
     */
    public function incBuyTotal()
    {
        $this->inc('buy_total')->update();

        return $this;
    }

    /**
     * 递减购买统计
     * @return $this
     */
    public function decBuyTotal()
    {
        $this->dec('buy_total')->update();

        return $this;
    }

    /**
     * 套餐名称设置器
     * @param $value
     * @param array $data
     * @return mixed|string
     */
    protected function setNameAttr($value, $data = [])
    {
        if (empty(trim($value))) {

            $type  = $data['type'] ?? self::FLOW_TYPE;
            $value = trim_float_zero($data['price']) . '元';

            if ($type === self::FLOW_TYPE) {
                $value .= $data['flow'] . '升套餐';
            } elseif ($type === self::TIME_TYPE) {
                $n = $data['second'] % 60;
                if (0 === $n) {
                    $value .= ($data['second'] / 60) . '分钟套餐';
                } else {
                    $value .= $data['second'] . '秒套餐';
                }
            }
        }

        return $value;
    }

    /**
     * 搜索列表
     * @param Query $query
     * @param $value
     */
    public function searchIndexAttr(Query $query, $value)
    {
        $query->where('name|mark', 'like', "%{$value}%");
    }

    protected function getAllFlowAttr($value, $data)
    {
        return $data['flow'] + $data['give_flow'];
    }

    protected function getTypeDescAttr($value, $data)
    {
        return $this->getEnumDesc(__FUNCTION__, $data);
    }
}
