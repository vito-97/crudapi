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

    public function agent()
    {
        $obj = new ArrayObject();

        Event::trigger(EventName::AGENT_DASHBOARD, $obj);

        return $obj->toArray();
    }

    public function waterCompany()
    {
        $obj = new ArrayObject();

        Event::trigger(EventName::WATER_COMPANY_DASHBOARD, $obj);

        return $obj->toArray();
    }

    public function repairUser()
    {
        $obj = new ArrayObject();

        Event::trigger(EventName::REPAIR_USER_DASHBOARD, $obj);

        return $obj->toArray();
    }

    public function waterworks()
    {
        $obj = new ArrayObject();

        Event::trigger(EventName::WATERWORKS_DASHBOARD, $obj);

        return $obj->toArray();
    }
}