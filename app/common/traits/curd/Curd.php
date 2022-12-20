<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/17
 * Time: 9:31
 */

namespace app\common\traits\curd;

use app\common\Enum;
use app\common\ErrorCode;
use app\exception\MessageException;
use think\Container;
use think\helper\Str;

trait Curd
{
    use CurdIndex, CurdRead, CurdEdit, CurdSave, CurdUpdate, CurdChange, CurdDelete;

    //curl映射方法
    protected $curd = [];
    //自动注册的CURD true会自动注册所有路由 否则传入数组
    protected $registerCurd = [];
    //自动注册的CURD存放的目录 true会自动获取类名转成下划线
    protected $registerCurdDir = null;
    //自动注册的CURD名称 null会自动获取类名
    protected $registerCurdName = null;

    /**
     * 调用方法
     * @param $name
     * @return mixed
     */
    protected function callCurdMethod($name)
    {
        $curd = $this->curd[$name] ?? '';
        $method = '_' . $name;

        if (empty($curd)) {
//            throw new ErrorException("未定义{$this->name}的{$name} CURD类");
            throw new MessageException(ErrorCode::ROUTE_NOT_FOUND);
        }

        $class = Container::getInstance()->invokeClass($curd);

        return $this->$method($class);
    }

    /**
     * 注册CURD
     * @return $this
     */
    protected function registerCurd()
    {
        if ($this->registerCurd) {
            $className = (new \ReflectionClass($this))->getShortName();

            if (true === $this->registerCurd) {
                $this->registerCurd = Enum::CURD;
            }

            if (true === $this->registerCurdDir) {
                $this->registerCurdDir = Str::snake($className);
            }

            if (!$this->registerCurdName) {
                $this->registerCurdName = $className;
            }


            $module = $this->app->http->getName();

            $dir = '';

            if ($this->registerCurdDir) {
                $dir = '\\' . $this->registerCurdDir;
            }

            $namespace = 'app\\' . $module . '\\curd' . $dir;

            $name = $this->registerCurdName;

            foreach ($this->registerCurd as $curd) {
                $this->curd[$curd] = $namespace . '\\' . $name . ucfirst($curd);
            }

        }
        return $this;
    }
}