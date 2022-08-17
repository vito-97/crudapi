<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:34
 */

namespace app\agent\controller;

use app\common\traits\curd\Curd;
use app\model\BaseModel;
use think\App;

class BaseController extends \app\BaseController
{
    use Curd;

    protected $agentScope = true;

    public function __construct(App $app)
    {
        parent::__construct($app);
        if ($this->agentScope) {
            $this->setAgentScope();
        }
    }

    /**
     * 设置查询运营商的数据
     * @return $this
     */
    protected function setAgentScope()
    {
        BaseModel::setGlobalScope(['agent' => $this->uid()]);

        return $this;
    }
}
