<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/17
 * Time: 9:31
 */

namespace app\common\traits\crud;

use app\common\Enum;
use app\common\ErrorCode;
use app\exception\MessageException;
use think\Container;
use think\helper\Str;

trait Crud
{
    use CrudIndex, CrudRead, CrudEdit, CrudSave, CrudUpdate, CrudChange, CrudDelete;

    //curl映射方法
    protected $crud = [];
    //自动注册的CRUD true会自动注册所有路由 否则传入数组
    protected $registerCrud = [];
    //自动注册的CRUD存放的目录 true会自动获取类名转成下划线
    protected $registerCrudDir = null;
    //自动注册的CRUD名称 null会自动获取类名
    protected $registerCrudName = null;

    /**
     * 调用方法
     * @param $name
     * @return mixed
     */
    protected function callCrudMethod($name)
    {
        $crud = $this->crud[$name] ?? '';
        $method = '_' . $name;

        if (empty($crud)) {
//            throw new ErrorException("未定义{$this->name}的{$name} CRUD类");
            throw new MessageException(ErrorCode::ROUTE_NOT_FOUND);
        }

        $class = Container::getInstance()->invokeClass($crud);

        return $this->$method($class);
    }

    /**
     * 注册CRUD
     * @return $this
     */
    protected function registerCrud()
    {
        if ($this->registerCrud) {
            $className = (new \ReflectionClass($this))->getShortName();

            if (true === $this->registerCrud) {
                $this->registerCrud = Enum::CRUD;
            }

            if (true === $this->registerCrudDir) {
                $this->registerCrudDir = Str::snake($className);
            }

            if (!$this->registerCrudName) {
                $this->registerCrudName = $className;
            }


            $module = $this->app->http->getName();

            $dir = '';

            if ($this->registerCrudDir) {
                $dir = '\\' . $this->registerCrudDir;
            }

            $namespace = 'app\\' . $module . '\\crud' . $dir;

            $name = $this->registerCrudName;

            foreach ($this->registerCrud as $crud) {
                $this->crud[$crud] = $namespace . '\\' . $name . ucfirst($crud);
            }

        }
        return $this;
    }
}
