<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/9
 * Time: 9:42
 */

namespace app\model\traits;


trait TreeTrait
{
    public function children()
    {
        return $this->hasMany($this->getName(), $this->parentKey ?? 'pid', $this->getPk())->with(['children']);
    }
}