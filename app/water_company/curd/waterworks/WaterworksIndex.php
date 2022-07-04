<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\water_company\curd\waterworks;

use app\water_company\curd\Index;
use app\common\Enum;
use app\validate\WaterworksValidate;

class WaterworksIndex extends Index
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
    protected $field = ['invitation_code', 'spread_count', 'is_vip',];
    //排除字段
    protected $withoutField = true;

    protected $queryField = ['sex', 'status', 'type', 'platform'];

    protected $validate = [
        WaterworksValidate::class => Enum::VALID_LIST_SCENE,
    ];

    protected $labelCallback = [
        'get_status_enum'   => ['name' => '状态'],
        'get_platform_enum' => ['name' => '类型'],
        'get_sex_enum'      => ['name' => '性别'],
    ];
}