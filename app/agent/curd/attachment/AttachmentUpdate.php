<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\agent\curd\attachment;

use app\agent\curd\Update;
use app\common\Enum;
use app\validate\AttachmentValidate;

class AttachmentUpdate extends Update
{
    //验证器
    protected $validate = [
        AttachmentValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //允许新增的数据字段
    protected $field = [];
    //获取对象时追加的字段
    protected $appendField = [];
    //排除的数据
    protected $exclude = [];
    //条件
    protected $where = [];
}