<?php
/**
 * Created by PhpStorm.
 * User: 19248
 * Date: 2022/11/12
 * Time: 15:44
 */

namespace app\model\traits;

use app\common\Util;
use think\Model;

trait PostsAttributeTrait
{
    public function getCoverAttr($value)
    {
        return Util::link($value);
    }

    public function setCoverAttr($value)
    {
        return Util::unlink($value);
    }

    public function setContentAttr($value)
    {
        return remove_xss($value);
    }

    public static function onBeforeWrite(Model $model)
    {
        if (empty($model->intro)) {
            $content      = strip_tags($model->content);
            $model->intro = mb_substr($content, 0, 255);
        }

        if (empty($model->create_time)) {
            $model->create_time = time();
        }
    }
}
