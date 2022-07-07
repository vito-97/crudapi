<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\system;

use app\common\curd\Index;
use app\common\Enum;
use app\validate\SystemLogValidate;

class SystemLogIndex extends Index
{
    use SystemLogTrait;

    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = ['index'];
    //追加数据
    protected $appendCallback = [];
    //查询条件
    protected $where = [];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //关联
    protected $with = [];

    protected $queryField = ['user_id', 'module', 'method'];

    protected $labelCallback = [
        'get_module_enum' => ['name' => '模块'],
        'get_method_enum' => ['name' => '请求方式'],
    ];

    protected $middleware = ['queryMiddleware'];

    protected $validate = [
        SystemLogValidate::class => Enum::VALID_LIST_SCENE,
    ];

    public function queryMiddleware($next)
    {
        $response = $next();

        $list = $this->getData('list');

        foreach ($list as $item) {
            $this->withUser($item);
        }

        return $response;
    }
}