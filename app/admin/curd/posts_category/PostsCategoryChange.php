<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\posts_category;

use app\admin\curd\category\CategoryChange;

class PostsCategoryChange extends CategoryChange
{
    protected $field = ['status', 'is_show', 'sort', 'single'];
}
