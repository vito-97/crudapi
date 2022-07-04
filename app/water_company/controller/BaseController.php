<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:34
 */

namespace app\water_company\controller;

use app\common\traits\curd\Curd;
use app\model\BaseModel;
use app\model\Customer;
use app\model\Product;
use app\model\Waterworks;
use think\App;

class BaseController extends \app\BaseController
{
    use Curd;

    protected $agentScope = true;

    public function __construct(App $app)
    {
        parent::__construct($app);
        Customer::setScope(['user' => $this->uid()]);
        Waterworks::setScope(['user' => $this->uid()]);
        Product::setScope(['agent' => $this->uid()]);
        if ($this->agentScope) {
            $this->setAgentScope();
        }
    }

    /**
     * 设置查询代理的数据
     * @return $this
     */
    protected function setAgentScope()
    {
        BaseModel::setGlobalScope(['water_company' => $this->uid()]);

        return $this;
    }
}