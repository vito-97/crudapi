<?php
/**
 * Created by PhpStorm.
 * User: 19248
 * Date: 2022/11/5
 * Time: 22:12
 */

namespace app\admin\crud;

class Index extends \app\common\crud\Index
{
    use LangTrait;

    protected $basicLabelCallback = [];

    protected function basicInit($next)
    {
        $response = parent::basicInit($next); // TODO: Change the autogenerated stub

        $this->setLangLabel()->setLangWith(true);

        return $response;
    }
}
