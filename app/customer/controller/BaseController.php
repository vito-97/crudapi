<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:34
 */

namespace app\customer\controller;

use app\common\traits\curd\Curd;
use app\model\BaseModel;
use app\model\Contract;
use app\model\Flow;
use app\model\WaterFetcher;
use think\App;
use think\db\Query;

class BaseController extends \app\BaseController
{
    use Curd;

    protected $agentScope = true;

    public function __construct(App $app)
    {
        parent::__construct($app);
        if ($this->agentScope) {
            $this->setScope();
        }
    }

    /**
     * 设置查询代理的数据
     * @return $this
     */
    protected function setScope()
    {
        Contract::setScope(['customer' => $this->uid()]);
        WaterFetcher::setScope(['user' => $this->uid()]);
        Flow::setScope(['customer_water_fetcher' => '']);
        Flow::macro('scopeCustomerWaterFetcher', function (Query $query) {
            $query->where('user_id', 'EXP', WaterFetcher::field('id')->where('user_id', $this->uid())->buildSql());
        });

        return $this;
    }
}