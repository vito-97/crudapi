<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/6
 * Time: 16:16
 */

namespace app\model\traits;

trait AgentTrait
{
    /**
     * 关联代理
     * @return \think\model\relation\BelongsTo
     */
    public function agent()
    {
        return $this->belongsTo('Member', 'agent_id', 'id')->field($this->agentField ?? 'id,nickname,username,status');
    }
}