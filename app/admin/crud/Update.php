<?php
/**
 * Created by PhpStorm.
 * User: 19248
 * Date: 2022/11/5
 * Time: 22:13
 */

namespace app\admin\crud;

class Update extends \app\common\crud\Update
{
    use LangTrait;

    protected $basicSaveMiddleware = ['saveLangMiddleware'];

    public function saveLangMiddleware($next, $model, $params)
    {
        $this->setLangTogether($params, $model);

        return $next($model, $params);
    }
}
