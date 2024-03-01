<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 10:11
 */

namespace app\common\crud;


use app\exception\ErrorException;
use app\exception\InvalidArgumentException;
use think\facade\Db;
use think\Model;

class Save extends BaseCrud
{
    protected $field = [];

    //追加的字段的数据
    protected $appendParams = [];
    //保存模型
    protected $model;

    protected $saveMiddleware = ['saveMiddleware'];
    protected $_saveMiddleware = [];

    protected function _init($next)
    {
        if ($this->withUser) {
            $this->setUser();
        }

        return $next();
    }

    /**
     * 执行
     * @return \app\model\BaseModel|mixed
     * @throws InvalidArgumentException
     */
    protected function query()
    {
        $params = $this->getParams('post');
        $model  = $this->getLogic()->getModel();

//        if ($this->field) {
//            $field = $this->getAllowField();
//            $model = $model->allowField($field);
//        }
        // 启动事务
        Db::startTrans();
        try {
            $middleware = array_merge($this->_saveMiddleware, $this->saveMiddleware);
            $detail     = $this->then($middleware, function ($params) use ($model) {

                if ($params instanceof Model) {
                    $detail = $params;
                    $detail->save();
                } else if (is_array($params)) {
                    $detail = $model->add($params, $this->together);
                } else {
                    throw new ErrorException('新增参数必须是数组或对象');
                }

                return $detail;
            }, $params);

            if ($detail) {
                $this->model = $detail;
                $this->setData('detail', $detail);
            }
            //提交事务
            Db::commit();

            return !!$detail;
        } catch (\Throwable $e) {
            //回滚事务
            Db::rollback();
            throw $e;
        }
    }

    /**
     * 调用保存中间件
     * @param $next
     * @param $params
     * @return mixed
     */
    protected function saveMiddleware($next, $params)
    {
        return $next($params);
    }
}
