<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/20
 * Time: 10:25
 */

namespace app\admin\listener\dashboard;

use app\common\ArrayObject;
use app\logic\UserLogic;

class DashboardListener
{
    /**
     * @param $params ArrayObject
     */
    public function handle($params)
    {
        $this->data($params);
    }

    protected function data($params)
    {
        $user   = new UserLogic();

        $params->merge([
            'count_user'                 => $user->count(),
        ]);
    }
}
