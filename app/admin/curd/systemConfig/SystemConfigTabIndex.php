<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\systemConfig;

use app\common\curd\Index;
use app\common\Enum;
use app\logic\SystemConfigLogic;
use app\validate\SystemConfigTabValidate;

class SystemConfigTabIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = ['index'];
    //追加数据
    protected $appendCallback = [];
    //追加标签数据
    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态'],
        'get_config'      => ['name' => '配置', 'key' => 'config'],
    ];
    //查询条件
    protected $where = [['pid', '=', 0]];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;

    protected $scope = ['sort'];

    protected $order = ['id' => 'asc'];
    /**
     * 需要查询条件的字段
     * 数据库字段和参数字段名不一样 'db_field' => 'param_field'
     * 数据库字段和参数字段名一样 'field'
     * @var array
     */
    protected $queryField = ['status', 'pid'];

    protected $with = ['children'];

    protected $append = ['config', 'children.config'];

    protected $validate = [SystemConfigTabValidate::class => Enum::VALID_LIST_SCENE];

//    protected $format = 'tree';

    public function getConfig()
    {
        $logic  = new SystemConfigLogic();
        $config = $logic->getConfigs();

        return $config;
    }
}