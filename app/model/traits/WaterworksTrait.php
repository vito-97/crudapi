<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/8/4
 * Time: 10:56
 */

namespace app\model\traits;


trait WaterworksTrait
{
    /**
     * 关联水厂
     * @return \think\model\relation\BelongsTo
     */
    public function waterworks()
    {
        return $this->belongsTo('Member', $this->waterworksForeignKey ?? 'waterworks_id', 'id')->field($this->waterworksField ?? 'id,nickname,username,status');
    }
}
