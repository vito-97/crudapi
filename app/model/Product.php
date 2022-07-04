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

    protected $hidden = ['update_time', 'delete_time'];

    protected $isVipEnum = self::SWITCH_ENUM;

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

    protected function setNameAttr($value, $data = [])
    {
        if (empty(trim($value))) {

            if (!empty($data['flow'])) {
                $value = $data['flow'] . '升套餐';
            } elseif (!empty($data['price'])) {
                $value = trim_float_zero($data['price']) . '元套餐';
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
}