<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 10:10
 */

namespace app\common\curd;

use app\exception\DataNotFoundException;
use app\exception\EmptyParamsException;
use app\exception\ParamErrorException;
use app\exception\ValidateException;
use app\validate\ChangeCurdValidate;
use think\facade\Db;
use think\Model;

class Change extends BaseCurd
{
    protected $validate = [ChangeCurdValidate::class];

    protected $field = [];

    protected $paramsName = ['id', 'field', 'value'];

    protected $where = [];

    protected $_middleware = ['queryMiddleware'];

    protected $_saveMiddleware = [];
    protected $saveMiddleware = ['saveMiddleware'];

    protected function _init($next)
    {
        if ($this->withUser) {
            $this->setUserMap();
        }

        return $next();
    }

    /**
     * @var array 排除的ID
     */
    protected $exclude = [];

    protected function query()
    {
        //获取数据
        $objs = $this->getObjs(['field' => null]);

        if (!$objs) {
            throw new DataNotFoundException();
        }

        $params                         = $this->getParams('put', false);
        $params[$this->params['field']] = $this->params['value'];

        if (empty($params)) {
            throw new EmptyParamsException();
        }

        foreach ($objs as $obj) {
            Db::startTrans();

            try {
                $this->formatModel($obj);

                $middleware = array_merge($this->_saveMiddleware, $this->saveMiddleware);
                $this->then($middleware, function (Model $obj, array $params) {
                    $logic = $this->getLogic();
                    return $logic->updateByID($obj, $params);
                }, $obj, $params);
                Db::commit();

            } catch (\Throwable $e) {
                Db::rollback();

                throw $e;
            }
        }

        return true;
    }

    /**
     * 检测字段和对应的数据
     * @throws ParamErrorException
     * @throws ValidateException
     */
    protected function queryMiddleware($next)
    {
        $this->checkExclude();
        $this->checkAllowField();
        $this->checkAllowValue();

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

    /**
     * 检测允许的字段
     * @return $this
     * @throws ValidateException
     */
    protected function checkAllowField()
    {
        if (!in_array($this->params['field'], $this->field)) {
            throw new ValidateException("{$this->params['field']}字段不允许修改");
        }

        return $this;
    }

    /**
     * 检测允许的值
     * @return $this
     * @throws ParamErrorException
     */
    protected function checkAllowValue()
    {
        $logic = $this->getLogic();
        $model = $logic->getModel();

        $enum = $model->getFieldEnum($this->params['field']);

        if ($enum && !in_array($this->params['value'], array_keys($enum))) {
            throw new ParamErrorException("修改值需要为[" . join(',', array_keys($enum)) . ']之一');
        }

        return $this;
    }
}
