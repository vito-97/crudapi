<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/30
 * Time: 14:26
 */

namespace app\validate;


class IDMustBeIntValidate extends BaseValidate
{
    protected $rule = [
      'id|ID' => 'require|isPositiveInteger'
    ];
}