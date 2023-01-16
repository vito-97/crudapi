<?php
/**
 * Created by PhpStorm.
 * User: 19248
 * Date: 2022/11/9
 * Time: 22:36
 */

namespace app\model;

/**
 * 语言表继承类
 */
abstract class BaseLangModel extends BaseModel
{
    protected $pk = ['target_id', 'lang'];
}
