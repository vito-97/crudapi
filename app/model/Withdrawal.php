<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:45
 */

namespace app\model;


class Withdrawal extends BaseModel
{
    const STATUS_WAIT = 0;
    const STATUS_PROGRESS = 1;
    const STATUE_RESOLVE = 2;
    const STATUS_REJECT = 3;
    const STATUS_CANCEL = 4;

    protected $statusEnum = [
        self::STATUS_WAIT => '待审核',
        self::STATUS_PROGRESS => '提现中',
        self::STATUE_RESOLVE => '已提现',
        self::STATUS_REJECT => '已拒绝',
        self::STATUS_CANCEL => '已取消',
    ];

    protected function getIsWaitAttr()
    {
        return $this->getData('status') == self::STATUS_WAIT;
    }

    protected function getIsProgressAttr()
    {
        return $this->getData('status') == self::STATUS_PROGRESS;
    }

    protected function getIsResolveAttr()
    {
        return $this->getData('status') == self::STATUE_RESOLVE;
    }

    protected function getIsRejectAttr()
    {
        return $this->getData('status') == self::STATUS_REJECT;
    }

    protected function getIsCancelAttr()
    {
        return $this->getData('status') == self::STATUS_CANCEL;
    }
}