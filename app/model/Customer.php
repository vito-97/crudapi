<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\model;

use app\model\traits\UserScopeTrait;

class Customer extends User
{
    use UserScopeTrait;

    const USER_TYPE = self::CUSTOMER_TYPE;

    protected $useSiteScope = false;

    /**
     * 关联水务公司
     * @return \think\model\relation\BelongsTo
     */
    public function waterCompany()
    {
        return $this->belongsTo('WaterCompany', 'user_id', 'id')->field($this->waterCompanyField ?? 'id,nickname,username,status');
    }
}
