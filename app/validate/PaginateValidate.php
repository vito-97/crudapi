<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/13
 * Time: 11:08
 */

namespace app\validate;


class PaginateValidate extends BaseValidate
{
    protected $rule = [
        'page'  => 'isPositiveInteger|min:1',
        'limit' => 'isPositiveInteger|min:1|max:200',
    ];
}