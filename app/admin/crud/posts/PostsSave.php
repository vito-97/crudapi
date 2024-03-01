<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\posts;

use app\admin\crud\Save;
use app\common\Enum;
use app\validate\PostsValidate;

class PostsSave extends Save
{
    //验证器
    protected $validate = [
        PostsValidate::class => Enum::VALID_SAVE_SCENE
    ];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = [];
}
