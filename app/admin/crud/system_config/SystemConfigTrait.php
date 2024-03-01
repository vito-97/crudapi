<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/19
 * Time: 10:47
 */

namespace app\admin\crud\system_config;


use app\logic\SystemConfigTabLogic;

trait SystemConfigTrait
{
    public function getConfigTabLabel(SystemConfigTabLogic $logic)
    {
        return $logic->getLabel();
    }

    protected function queryMiddleware($next)
    {

        if (!$this->request->param('system_config_tab_id')) {
            $this->labelCallback['get_config_tab_label'] = ['name' => '配置类', 'field' => 'system_config_tab_id', 'key' => 'system_config_tab'];
        }

        return $next();
    }
}
