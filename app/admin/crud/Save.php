<?php
/**
 * Created by PhpStorm.
 * User: 19248
 * Date: 2022/11/5
 * Time: 22:13
 */

namespace app\admin\crud;

class Save extends \app\common\crud\Save
{
    use LangTrait;

    protected $basicSaveMiddleware = ['saveLangMiddleware'];

    public function saveLangMiddleware($next, $params)
    {
        $this->setLangTogether($params);

        return $next($params);
    }
}
