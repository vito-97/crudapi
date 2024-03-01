<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\system_config_tab;

use app\admin\crud\Read;

class SystemConfigTabRead extends Read
{
    //需要展示的字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //追加输出的属性
    protected $append = [];
    //条件
    protected $where = [];
    //关联
    protected $with = [];

    protected $middleware = ['queryMiddleware'];

    protected function queryMiddleware($next)
    {
        if ($this->request->param('child')) {
            $this->with[] = 'child';
        }

        return $next();
    }
}
