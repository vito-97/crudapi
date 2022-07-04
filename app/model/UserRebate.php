<?php
declare (strict_types=1);

namespace app\model;


class UserRebate extends BaseModel
{
    const STATUS_WAIT_CONFIRM = 0;
    const STATUS_ON = 1;
    const STATUS_OFF = 2;

    protected $statusEnum = [
        self::STATUS_WAIT_CONFIRM => '待确认',
        self::STATUS_ON => '有效',
        self::STATUS_OFF => '无效',
    ];

    const PM_DEC = 0;
    const PM_INC = 1;

    protected $pmEnum = [
        self::PM_DEC => '支出',
        self::PM_INC => '收入',
    ];

    protected function getIsOnAttr()
    {
        return $this->getData('status') == self::STATUS_ON;
    }
}
