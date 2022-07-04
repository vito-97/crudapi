<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\system;

use app\common\curd\Index;
use app\common\Util;
use think\helper\Str;

class SystemAuthIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = [];
    //追加数据
    protected $appendCallback = [];
    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
        'get_module_enum' => ['name' => '模块', 'key' => 'module'],
    ];
    //查询条件
    protected $where = [];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;

    protected $usePaginate = false;

    protected $limit = 0;

    protected $middleware = [
        'queryMiddleware',
    ];

    public function queryMiddleware($next)
    {
        $response = $next();

        $list = $this->getData('list');

        $list = Util::tree($list);

        $this->setData('list', $list);

        return $response;
    }
}