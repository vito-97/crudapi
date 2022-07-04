<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\model;

use app\model\traits\AgentTrait;
use app\model\traits\DeviceTrait;
use app\model\traits\RepairUserTrait;
use app\model\traits\UserTrait;
use think\db\Query;

class DeviceRepair extends BaseModel
{
    use AgentTrait, UserTrait;
    use DeviceTrait;
    use RepairUserTrait;

    const WAIT_STATUS = 0;
    const IN_PROCESS_STATUS = 1;
    const SUCCESS_STATUS = 2;

    protected $statusEnum = [
        self::WAIT_STATUS       => '待处理',
        self::IN_PROCESS_STATUS => '处理中',
        self::SUCCESS_STATUS    => '已完成',
    ];

    /**
     * 搜索列表
     * @param Query $query
     * @param $value
     */
    public function searchIndexAttr(Query $query, $value)
    {
        $query->where('title|content|mark', 'like', "%{$value}%");
    }
}
