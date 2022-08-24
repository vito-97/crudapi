<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\api\curd\device;

use app\common\curd\Index;
use app\common\Enum;
use app\logic\CustomerLogic;
use app\logic\DeviceLogic;
use app\logic\WaterworksLogic;
use app\model\Device;
use app\model\User;
use think\facade\Db;

class DeviceIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = [];
    //追加标签数据
    protected $labelCallback = [];
    //查询条件
    protected $where = [
        ['status', '=', Device::STATUS_ON],
    ];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //关联
    protected $with = [];

    /**
     * 需要查询条件的字段
     * 数据库字段和参数字段名不一样 'db_field' => 'param_field'
     * 数据库字段和参数字段名一样 'field'
     * @var array
     */
    protected $queryField = ['site_id', 'type', 'agent_id'];

    protected $middleware = ['queryMiddleware'];

    //查询中间件
    protected function queryMiddleware($next)
    {
        $lat = $this->request->param('lat');
        $lng = $this->request->param('lng');
        //查询附近10公里的设备
        if ($lat && $lng && is_numeric($lat) && is_numeric($lng)) {
            $user     = $this->user->getUserInfo();
            $deviceNo = $this->request->param('device_no');

            if ($deviceNo) {
                $device  = (new DeviceLogic())->getByDeviceNo($deviceNo);
                $agentID = $device->agent_id;
                //排除了当前的设备
                $this->where[] = ['id', '<>', $device->id];
            }

            if ($user) {
                if ($user->type == User::WATER_FETCHER_TYPE) {
                    //获取水务公司的ID
                    $waterCompanyID    = (new CustomerLogic())->where('status', 1)->where('id', $user->user_id)->cache(60)->value('user_id');
                    $waterworksUserSql = $this->getWaterworksIDSqlByWaterCompanyID($waterCompanyID);
                    //获取该水务公司下所有的水厂的设备
                    $this->where[] = ['agent_id', 'EXP', Db::raw('IN' . $waterworksUserSql)];
                } elseif (isset($device)) {
                    if ($device->site_id == Enum::SITE_ONE) {
                        $this->where[] = ['agent_id', '=', $agentID];
                    } else {
                        $waterCompanyID    = (new WaterworksLogic())->where('status', 1)->where('id', $device->agent_id)->cache(60)->value('user_id');
                        $waterworksUserSql = $this->getWaterworksIDSqlByWaterCompanyID($waterCompanyID);
                        $this->where[]     = ['agent_id', 'EXP', Db::raw('IN' . $waterworksUserSql)];
                    }
                }
            }

            $distance = '(6371 * acos (cos ( radians( ' . $lat . ' ) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians( ' . $lng . ' ) ) + sin ( radians( ' . $lat . ' ) ) * sin( radians( lat ) ) )) AS distance';

            $this->field = Db::raw('id,name,lat,lng,device_no,status,state,address,create_time,' . $distance);

            $this->order = ['distance' => 'ASC'];

            $this->having = '`distance` < 100';

            $this->where[] = ['lat', '<>', ''];
            $this->where[] = ['lng', '<>', ''];

//            $count = $this->getLogic()->getModel()->fieldRaw('COUNT(*) AS nums,' . $distance)->having($this->having)->fetchSql()->find();

            $this->simple = true;
//            $this->fetchSql = true;
        }

        return $next();
    }

    protected function getWaterworksIDSqlByWaterCompanyID($id)
    {
        $sql = (new WaterworksLogic())->field('id')->where('user_id', $id)->buildSql();

        return $sql;
    }
}
