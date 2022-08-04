<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\api\curd\device;

use app\common\curd\Index;
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
    protected $where = [];
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
    protected $queryField = [];

    protected $middleware = ['queryMiddleware'];

    //查询中间件
    protected function queryMiddleware($next)
    {
        $lat = $this->request->param('lat');
        $lng = $this->request->param('lng');
        //查询附近3公里的设备
        if ($lat && $lng && is_numeric($lat) && is_numeric($lng)) {
            $distance = '(6371 * acos (cos ( radians( ' . $lat . ' ) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians( ' . $lng . ' ) ) + sin ( radians( ' . $lat . ' ) ) * sin( radians( lat ) ) )) AS distance';

            $this->field  = Db::raw('*,' . $distance);
            $this->having = 'distance < 3';

//            $count = $this->getLogic()->getModel()->fieldRaw('COUNT(*) AS nums,' . $distance)->having($this->having)->fetchSql()->find();

            $this->simple = true;
//            $this->fetchSql = true;
        }

        return $next();
    }
}
