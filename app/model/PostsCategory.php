<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types = 1);

namespace app\model;

class PostsCategory extends Category
{
    protected $currentType = self::POSTS_TYPE;

    public function posts()
    {
        return $this->hasMany('Posts', 'category_id');
    }
}
