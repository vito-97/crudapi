<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\device;

use app\common\curd\Index;
use app\common\Enum;
use app\validate\DeviceControlValidate;

class DeviceControlIndex extends Index
{
    use DeviceControlTrait;
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = [];
    //追加数据
    protected $appendCallback = [];
    //查询条件
    protected $where = [];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //关联
    protected $with = ['user'];

    protected $middleware = ['setWithMiddleware'];
    /**
     * 需要查询条件的字段
     * 数据库字段和参数字段名不一样 'db_field' => 'param_field'
     * 数据库字段和参数字段名一样 'field'
     * @var array
     */
    protected $queryField = ['device_id', 'user_id', 'state'];

    protected $validate = [
        DeviceControlValidate::class => Enum::VALID_LIST_SCENE,
    ];



}