<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\adverts;

use app\common\curd\Index;
use app\common\Enum;
use app\validate\AdvertsValidate;

class AdvertsIndex extends Index
{
    /**
     * 关键词查询指定字段
     * @var string[]
     */
    protected $keywordQueryArgs = ['index'];
    //追加数据
    protected $appendCallback = [];
    protected $labelCallback = ['get_status_enum' => ['name' => '状态', 'key' => 'status']];
    //查询条件
    protected $where = [];
    //字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;

    protected $with = ['admin'];

    protected $validate = [
        AdvertsValidate::class => Enum::VALID_LIST_SCENE,
    ];

    protected $queryField = [
        'status', 'admin_id',
    ];
}