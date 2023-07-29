<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 10:09
 */

namespace app\common\curd;


use app\exception\DataNotFoundException;
use app\validate\IDMustBeIntValidate;
use think\facade\Db;
use think\Model;

class Update extends BaseCurd
{
    //允许修改字段值
    protected $field = [];
    //获取对象时追加的字段
    protected $appendField = [];
    //更新条件
    protected $where = [];
    //排除的ID
    protected $exclude = [];

    protected $model;

    protected $_middleware = ['queryMiddleware'];

    protected $saveMiddleware = ['saveMiddleware'];

    protected $_saveMiddleware = [];

    protected function _init($next)
    {
        array_unshift($this->validate, IDMustBeIntValidate::class);

        $response = $next();

        if ($this->withUser) {
            $field = is_string($this->withUser) ? $this->withUser : $this->userField;
            $this->getParamsExcept[] = $field;
            $this->setUser();
            $this->setUserMap();
        }

        return $response;
    }

    /**
     * 执行操作
     * @return bool
     * @throws DataNotFoundException
     * @throws \app\exception\EmptyParamsException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function query()
    {
        //排除空数据
        $data = array_filter($this->getParams('put'), function ($item) {
            return $item !== '' && !is_null($item);
        });

        //获取数据
        $obj = $this->getObj(['field' => null]);

        if (!$obj) {
            throw new DataNotFoundException();
        }
        Db::startTrans();
        try {
            $middleware = array_merge($this->_saveMiddleware, $this->saveMiddleware);
            $status     = $this->then($middleware, function (Model $obj, array $params) {
                $logic = $this->getLogic();
                $args  = $this->getQueryArgs(['where', 'together']);

                return $status = $logic->updateByID($obj, $params, $args);
            }, $obj, $data);

            if ($status) {
                $this->model = $obj;
                $this->setData('detail', $status);
            }

            Db::commit();

            return !!$status;
        } catch (\Throwable $e) {
            Db::rollback();
            throw $e;
        }
    }

    /**
     * @return bool|void
     * @throws \app\exception\DataInoperableException
     */
    protected function queryMiddleware($next)
    {
        $this->checkExclude();
        return $next();
    }

    /**
     * 调用保存中间件
     * @param $next
     * @param Model $model
     * @param array $params
     * @return mixed
     */
    protected function saveMiddleware($next, Model $model, array $params)
    {
        return $next($model, $params);
    }
}
