<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\posts_category;

use app\admin\curd\category\CategoryUpdate;
use app\common\Enum;
use app\validate\PostsCategoryValidate;

class PostsCategoryUpdate extends CategoryUpdate
{
    //验证器
    protected $validate = [
        PostsCategoryValidate::class => Enum::VALID_UPDATE_SCENE
    ];
}
