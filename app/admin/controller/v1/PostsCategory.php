<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types = 1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\PostsCategoryLogic;

class PostsCategory extends BaseController
{
    protected $name = '文章分类';

    protected $registerCrud = true;

    protected $registerCrudDir = true;
    /**
     * 初始化
     */
    protected function initialize()
    {
        $this->logic = new PostsCategoryLogic();
    }

}
