<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\systemConfig;

use app\common\curd\Index;
use app\common\Enum;
use app\logic\SystemConfigTabLogic;
use app\validate\SystemConfigValidate;

class SystemConfigIndex extends Index
{
    use SystemConfigTrait;
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
        'get_type_enum' => ['name' => '类型'],
//        'get_input_type_enum' => ['name' => '输入框类型'],
//        'get_upload_type_enum' => ['name' => '上传类型'],
    ];
    //查询条件
    protected $where = [];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //关联
    protected $with = [];

    protected $middleware = [
        'queryMiddleware',
    ];
    /**
     * 需要查询条件的字段
     * 数据库字段和参数字段名不一样 'db_field' => 'param_field'
     * 数据库字段和参数字段名一样 'field'
     * @var array
     */
    protected $queryField = ['status', 'type', 'system_config_tab_id'];

    protected $validate = [
        SystemConfigValidate::class => Enum::VALID_LIST_SCENE,
    ];
}