<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\posts_category;

use app\admin\crud\category\CategoryDelete;
use app\exception\MessageException;
use think\Model;

class PostsCategoryDelete extends CategoryDelete
{
    protected $withCount = ['posts'];

    protected function deleteMiddleware($next, Model $model)
    {
        if ($model->posts_count) {
            throw new MessageException('该分类下有文章，不可删除');
        }

        return parent::deleteMiddleware($next, $model); // TODO: Change the autogenerated stub
    }
}
