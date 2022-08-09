<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/8/9
 * Time: 10:12
 */

namespace app\api\controller\v1;

use app\api\controller\BaseController;
use app\logic\WaterFetcherLogic;
use app\validate\WaterFetcherValidate;

class WaterFetcher extends BaseController
{
    protected function initialize()
    {
        $this->logic = new WaterFetcherLogic();
    }

    public function bind()
    {
        WaterFetcherValidate::batchCheck('bind');

        $params = WaterFetcherValidate::getDataByRule('bind');

        $detail = $this->logic->bindUser($params['username'], $params['password']);

        return $this->success(['detail' => $detail]);
    }
}
