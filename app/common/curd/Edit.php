<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 10:11
 */

namespace app\common\curd;

use app\exception\DataNotFoundException;

class Edit extends BaseCurd
{
    protected $field = [];

    protected $where = [];

    protected $with = null;

    protected $append = [];

    protected $_middleware = [
        'labelCallbackMiddleware',
    ];

    protected $editMiddleware = ['editMiddleware'];

    protected function query()
    {
        //ID有传则获取数据
        if ($this->params['id']) {
            $obj = $this->getObj();

            if (!$obj) {
                throw new DataNotFoundException();
            }

            $this->formatModel($obj);

            $this->then($this->editMiddleware, function ($obj) {
                return $obj;
            }, $obj);

            $this->setData('detail', $obj);
        } else {
            $this->setData('detail', []);
        }

        return true;
    }

    /**
     * 调用保存中间件
     * @param $next
     * @param $model
     * @return mixed
     */
    protected function editMiddleware($next, $model)
    {
        return $next($model);
    }
}