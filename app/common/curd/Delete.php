<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 10:09
 */

namespace app\common\curd;

use app\exception\DataNotFoundException;
use app\validate\IDMustBeIntArrayValidate;
use think\Model;

class Delete extends BaseCurd
{
    protected $where = [];

    /**
     * @var array 排除删除的ID可以添加到里面
     */
    protected $exclude = [];

    /**
     * @var string[] 验证器
     */
    protected $validate = [IDMustBeIntArrayValidate::class];

    protected $_middleware = ['queryMiddleware'];

    protected $deleteMiddleware = ['deleteMiddleware'];

    protected function query()
    {
        $this->with = $this->together;
        //获取数据集合
        $objs = $this->getObjs();
        if (!$objs) {
            throw new DataNotFoundException('找不到数据或数据不可删除');
        }

        //循环删除
        foreach ($objs as $obj) {
            //删除数据
            $this->then($this->deleteMiddleware, function (Model $obj) {
                $logic = $this->getLogic();
                $args  = $this->getQueryArgs(['where', 'together']);

                return $logic->deleteByID($obj, $args);
            }, $obj);
        }

        return true;
    }

    protected function queryMiddleware($next)
    {
        //是否为排除的ID
        $this->checkExclude();

        return $next();
    }

    protected function deleteMiddleware($next, Model $model)
    {
        return $next($model);
    }
}