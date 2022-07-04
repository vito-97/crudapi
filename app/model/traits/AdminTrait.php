<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/31
 * Time: 17:58
 */

namespace app\model\traits;


trait AdminTrait
{
    public function admin(){
        return $this->belongsTo('Admin')->field('id,username,nickname');
    }
}