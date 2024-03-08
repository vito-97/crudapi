<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 10:11
 */

namespace app\common\crud;

use app\exception\DataNotFoundException;

class Edit extends BaseCrud
{
    protected $field = [];

    protected $where = [];

    protected $with = null;

    protected $append = [];

    protected $basicMiddleware = [
        'labelCallbackMiddleware',
    ];

    protected $basicEditMiddleware = [];
    protected $editMiddleware = ['editMiddleware'];

    protected function basicInit($next)
    {
        $response = $next();

        if ($this->withUser) {
            $this->setUserMap();
        }

        return $response;
    }

    protected function query()
    {
        //ID有传则获取数据
        if ($this->params['id']) {
            $obj = $this->getObj();

            if (!$obj) {
                throw new DataNotFoundException();
            }

            $this->formatModel($obj);

            $middleware = array_merge($this->basicEditMiddleware, $this->editMiddleware);
            $this->then($middleware, function ($obj) {
                return $obj;
            }, $obj);

            $this->setData('detail', $obj);
        } else {
            $this->setData('detail', $this->getDefaultDetail());
        }

        return true;
    }

    /**
     * 获取默认的详情数据
     * @return array
     */
    protected function getDefaultDetail(): array
    {
        return [];
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
