<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\systemConfig;

use app\common\curd\Delete;
use app\exception\MessageException;
use app\model\SystemConfig;
use think\Model;

class SystemConfigTabDelete extends Delete
{
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];

    protected $together = [];

    /**
     * 删除中间件
     * @param $next
     * @param Model $model
     * @return mixed
     */
    protected function deleteMiddleware($next, Model $model)
    {
        $ids = $this->getLogic()->getChildrenID($model->id, true);

        $count = SystemConfig::where('system_config_tab_id', 'IN', $ids)->count();

        if ($count) {
            throw new MessageException(sprintf('该配置分类%s共有%d个配置，请先删除配置再将配置分类删除', count($ids) > 1 ? '以及下级配置分类' : '', $count));
        }

        return $next($model);
    }
}