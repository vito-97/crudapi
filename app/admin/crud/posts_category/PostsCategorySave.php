<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\posts_category;

use app\admin\crud\category\CategorySave;
use app\common\Enum;
use app\validate\PostsCategoryValidate;

class PostsCategorySave extends CategorySave
{
    //验证器
    protected $validate = [
        PostsCategoryValidate::class => Enum::VALID_SAVE_SCENE
    ];
}
