<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\device;

use app\common\curd\Index;
use app\common\Enum;
use app\validate\DeviceValidate;

class DeviceIndex extends Index
{
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

    protected $with = ['agent'];

    protected $append = ['qrcode_url', 'state_desc'];

    protected $hidden = [];

    protected $queryField = [
        'agent_id', 'status',
    ];

    protected $labelCallback = [
        'get_status_enum' => ['name' => '状态', 'key' => 'status'],
        'get_state_enum'  => ['name' => '使用状态', 'key' => 'state'],
        'get_type_enum'   => ['name' => '类型', 'key' => 'type'],
    ];

    protected $validate = [
        DeviceValidate::class => Enum::VALID_LIST_SCENE,
    ];

/*    protected $middleware = [
        'queryMiddleware',
    ];

    protected function queryMiddleware($next)
    {
        $response = $next();



        return $response;
    }*/
}
