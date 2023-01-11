<?php
/**
 * Created by PhpStorm.
 * User: 19248
 * Date: 2022/11/5
 * Time: 22:13
 */

namespace app\admin\curd;

class Update extends \app\common\curd\Update
{
    use LangTrait;

    protected $_saveMiddleware = ['saveLangMiddleware'];

    public function saveLangMiddleware($next, $model, $params)
    {
        $this->setLangTogether($params, $model);

        return $next($model, $params);
    }
}
