<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 16:05
 */

namespace app\common\basic;


use app\common\response\driver\Json;
use think\Container;
use think\facade\Config;
use think\helper\Str;

abstract class Storage
{
    //命名空间
    protected $namespace;

    //驱动类
    protected $drivers = [];

    //驱动类型
    protected $name;

    //驱动配置
    protected $config = [];

    //驱动的配置文件
    protected $configFile;

    //是否有驱动文件配置
    protected $hasConfigFile = false;

    public function __construct($name = null, $config = [])
    {
        if (is_array($name)) {
            $config = $name;
            $name = null;
        }

        if ($name)
            $this->name = $name;
        if ($config)
            $this->config = $config;

        $this->initConfig();
        $this->init();
    }

    protected function init()
    {
    }

    /**
     * 初始化获取配置
     * @return $this
     */
    protected function initConfig()
    {
        if ($this->hasConfigFile) {
            if (!$this->configFile)
                $this->configFile = Str::snake($this->name ?? (new \ReflectionClass($this))->getShortName());

            $config = Config::get("{$this->configFile}", []);

            if (!$this->name && !empty($config['default'])) {
                $this->name = $config['default'];
            }

            if (!empty($config['stores'][$this->name])) {
                $this->config = array_merge($config['stores'][$this->name], $this->config);
            }
        }

        return $this;
    }

    //获取默认驱动
    abstract protected function getDefaultDriver(): string;


    /**
     * 获取驱动
     * @param null $name
     * @return mixed
     */
    public function driver($name = null)
    {
        $name = $name ?? $this->name;
        $name = $name ?? $this->getDefaultDriver();

        return $this->drivers[$name] = $this->getDriver($name);
    }

    /**
     * 获取驱动
     * @param $name
     * @return mixed
     */
    protected function getDriver($name)
    {
        return $this->drivers[$name] ?? $this->createDriver($name);
    }


    /**
     * 创建驱动
     * @param $name
     * @return mixed
     */
    protected function createDriver($name)
    {
        $method = 'create' . Str::studly($name) . 'Driver';

        if (method_exists($this, $method)) {
            return $this->$method();
        }

        $class = $this->getNamespace() . ucfirst($name);

        return Container::getInstance()->invokeClass($class, [$this->name, $this->config]);
    }

    /**
     * 获取命名空间
     * @return string
     */
    protected function getNamespace()
    {
        return $this->namespace ?: (new \ReflectionClass($this))->getNamespaceName() . '\driver\\';
    }

    /**
     * 调用当前的驱动方法
     * @param $method
     * @param $args
     * @return mixed
     */
    public function __call($method, $args)
    {
        return $this->driver()->$method(...$args);
    }
}
