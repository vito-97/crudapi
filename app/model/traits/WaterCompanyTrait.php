<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/27
 * Time: 16:57
 */

namespace app\model\traits;

use app\model\User;

trait WaterCompanyTrait
{
    /**
     * 关联水务公司
     * @return \think\model\relation\BelongsTo
     */
    public function waterCompany()
    {
        return $this->belongsTo('WaterCompany', 'water_company_id', 'id')->field($this->waterCompanyField ?? 'id,nickname,username,status');
    }
}