<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/19
 * Time: 15:09
 */

namespace app\logic;

use app\common\ArrayObject;
use app\common\EventName;
use think\facade\Event;

class DashboardLogic extends BaseLogic
{
    protected function getModelName()
    {
        return null;
    }

    public function admin()
    {
        $obj = new ArrayObject();

        Event::trigger(EventName::ADMIN_DASHBOARD, $obj);

        return $obj->toArray();
    }
}