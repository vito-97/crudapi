<?php
/**
 * Created by PhpStorm.
 * User: 19248
 * Date: 2022/11/5
 * Time: 22:13
 */

namespace app\admin\crud;

class Edit extends \app\common\crud\Edit
{
    use LangTrait;

    protected $basicLabelCallback = [];

    protected function basicInit($next)
    {
        $response = parent::basicInit($next); // TODO: Change the autogenerated stub

        $this->setLangLabel()->setLangWith();

        return $response;
    }
}
