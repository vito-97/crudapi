<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\crud\posts_category;

use app\admin\crud\category\CategoryChange;

class PostsCategoryChange extends CategoryChange
{
    protected $field = ['status', 'is_show', 'sort', 'single'];
}
