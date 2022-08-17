<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:34
 */

namespace app\coupon_user\controller;

use app\common\traits\curd\Curd;
use app\model\BaseModel;
use think\App;

class BaseController extends \app\BaseController
{
    use Curd;

    protected $userScope = true;

    public function __construct(App $app)
    {
        parent::__construct($app);
        if ($this->userScope) {
            $this->setScope();
        }
    }

    /**
     * 设置查询运营商的数据
     * @return $this
     */
    protected function setScope()
    {
        BaseModel::setGlobalScope(['coupon_user_id' => $this->uid()]);

        return $this;
    }
}
