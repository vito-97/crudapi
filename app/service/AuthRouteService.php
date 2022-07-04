<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/15
 * Time: 16:59
 */

namespace app\service;


use app\common\Enum;

class AuthRouteService
{
    /**
     * 需要解析的模块
     * @var string[]
     */
    protected $onlyModule = [
        'admin', 'api', 'agent', 'repair_user', 'coupon_user',
    ];

    /**
     * 排除的控制器
     * @var string[]
     */
    protected $excludeController = [
        'BaseController',
        'Error',
        'Test',
    ];

    protected $excludeMethod = [

    ];

    /**
     * 公共方法对应的名称
     * @var string[]
     */
    protected $commomMethodName = [
        'index'  => '%s列表',
        'save'   => '添加%s',
        'update' => '修改%s',
        'read'   => '获取%s详情',
        'edit'   => '添加或修改获取%s详情',
        'change' => '修改%s字段值',
        'delete' => '删除%s',
    ];

    /**
     * 方法对应的名称
     * 类名 => [
     *  方法名 => 方法名称
     * ]
     * @var array
     */
    protected $methodName = [];

    /**
     * app目录
     * @var string
     */
    protected $appPath;

    public function __construct()
    {
        $this->appPath = base_path();
    }


    /**
     * 获取所有路由
     * @return array
     * @throws \ReflectionException
     * @throws \app\exception\ErrorException
     */
    public function all()
    {
        $modules = $this->getModules();

        $controllers = $this->getControllers($modules);

        $router = $this->getRoute($controllers);

        return $router;
    }

    /**
     * 获取类名
     * @param $route
     * @return mixed|string
     * @throws \ReflectionException
     */
    public function getClassNameByRoute($route)
    {
        $array  = explode('/', str_replace('.', '/', $route));
        $module = array_shift($array);

        $string = 'app/' . $module . '/controller/' . join('/', $array);

        $className = str_replace('/', '\\', dirname($string));

        $refection  = new \ReflectionClass($className);
        $properties = $refection->getDefaultProperties();

        $controlName = basename($route);

        if (isset($properties['name'])) {
            $controlName = $properties['name'];
        }

        return $controlName;
    }

    /**
     * 通过路由获取控制器方法对应的名称
     * @param $route
     * @return string
     * @throws \ReflectionException
     */
    public function getMethodNameByRoute($route)
    {
        $name   = $route;
        $array  = explode('/', str_replace('.', '/', $route));
        $module = array_shift($array);

        $string = 'app/' . $module . '/controller/' . join('/', $array);

        $className = str_replace('/', '\\', dirname($string));
        $method    = basename($string);

        $refection  = new \ReflectionClass($className);
        $properties = $refection->getDefaultProperties();

        $controlName = '';

        if (isset($properties['name'])) {
            $controlName = $properties['name'];
        }

        $methodName = array_merge($this->commomMethodName, $properties['methodName'] ?? []);

        if (isset($methodName[$method])) {
            $name = sprintf($methodName[$method], $controlName);
        }

        return $name;
    }

    /**
     * 通过路由获取反射类
     * @param $route
     * @return \ReflectionClass
     * @throws \ReflectionException
     */
    public function getReflectionClassByRoute($route)
    {
        $array  = explode('/', str_replace('.', '/', $route));
        $module = array_shift($array);

        $string = 'app/' . $module . '/controller/' . join('/', $array);

        $className = str_replace('/', '\\', dirname($string));

        $refection = new \ReflectionClass($className);

        return $refection;
    }

    /**
     * 获取当前所有模块
     * @return array
     */
    public function getModules()
    {
        $modules = $this->getModulesNames();

        $modules = $this->filterModules($modules);

        return $modules;
    }

    /**
     * 获取所有控制器
     * @param $modules
     * @param string $controllerDir
     * @return array
     * @throws \app\exception\ErrorException
     */
    public function getControllers($modules, $controllerDir = 'controller')
    {
        if (!is_array($modules)) {
            $modules = [$modules];
        }

        $fileSystem = new FileSystemService();

        $files = [];

        foreach ($modules as $module) {
            $basePath = $this->appPath . $module . DIRECTORY_SEPARATOR . $controllerDir;
            if (file_exists($basePath)) {
                $files[$module] = $fileSystem->getDirFiles($basePath);
            }
        }
        $files = $this->parseController($files);

        return $files;
    }

    /**
     * 获取所有模块的路由
     * @param $array
     * @return array
     * @throws \ReflectionException
     */
    public function getRoute($array)
    {
        $routes = [];

        foreach ($array as $module => $controllers) {
            foreach ($controllers as $class) {
                $methods = $this->getClassMethods($class);

                foreach ($methods as $method) {
                    $baseRoute = $this->getRouteName($class, $module);
                    $route     = $baseRoute . '/' . $method->getName();
                    $routes[]  = $route;
                }
            }
        }

        return $routes;
    }

    /**
     * 获取类的方法
     * @param $class
     * @return \ReflectionMethod[]
     * @throws \ReflectionException
     */
    protected function getClassMethods($class)
    {
        $baseRoute = $this->getRouteName($class);

        $reflection = new \ReflectionClass($class);

        $excludeMethod = Enum::CURD;

        $properties = $reflection->getDefaultProperties();

        //获取类的CURD
        $curd = [];

        if (!empty($properties['curd'])) {
            $curd = array_keys($properties['curd']);
        } elseif (!empty($properties['registerCurd'])) {
            if (true === $properties['registerCurd']) {
                $curd = Enum::CURD;
            } else {
                $curd = $properties['registerCurd'];
            }
        }

        if ($curd) {
            //排除没用到的CURD
            $excludeMethod = array_diff(Enum::CURD, $curd);
        }

        //获取所有公开的方法
        $methods = $reflection->getMethods(\ReflectionMethod::IS_PUBLIC);

        //过滤一些不需要的方法
        $methods = array_filter($methods, function ($method) use ($baseRoute, $excludeMethod) {
            $name  = $method->getName();
            $route = $baseRoute . '/' . $name;
            if (0 === strpos($name, '__')) {
                return false;
            } elseif (in_array($route, $this->excludeMethod) || in_array($name, $excludeMethod)) {
                return false;
            }

            return true;
        });

        return $methods;
    }

    /**
     * 获取路由
     * @param $class
     * @param null $module
     * @return string
     */
    public function getRouteName($class, $module = null)
    {
        $rule = '#app\\\(?<module>\w+)\\\controller\\\(?<route>[\s\S]*)#';
        preg_match($rule, $class, $match);

        $module = $module ?: $match['module'];

        /*if (empty($match['route'])) {
            dump($class);
            dump($module);
            die;
        }*/

        $route = str_replace('\\', '.', $match['route']);

        return $module . '/' . $route;
    }

    /**
     * 获取所有模块的名称
     * @return array|null[]|string[]|\string[][]
     */
    protected function getModulesNames()
    {
        return array_map(function ($item) {

            if (!is_dir($item)) {
                return null;
            }

            $name = pathinfo($item, PATHINFO_FILENAME);

            return $name;
        }, glob($this->appPath . '*'));
    }

    /**
     * 过滤不需要的应用模块
     * @param $modules
     * @return array
     */
    protected function filterModules($modules)
    {
        return array_filter(
            $modules,
            function ($item) {
                return $item && in_array($item, $this->onlyModule);
            }
        );
    }

    /**
     * 解析控制器
     * @param $files
     * @return array
     */
    protected function parseController($files)
    {
        //格式控制器名称
        foreach ($files as $module => $controller) {
            $files[$module] = $this->formatController($module, $controller);
        }

        //过滤控制器
        foreach ($files as $module => $controller) {
            $files[$module] = $this->filterController($module, $controller);
        }

        return $files;
    }

    /**
     * 过滤控制器
     * @param $module
     * @param $names
     * @return array
     */
    protected function filterController($module, $names)
    {
        $names = array_filter($names, function ($item) use ($module) {
            $basename = pathinfo($item, PATHINFO_BASENAME);

            //基类
            if (in_array($basename, $this->excludeController)) {
                return false;
            }

            $route = $this->getRouteName($item, $module);

            //包含路由
            if (in_array($route, $this->excludeController)) {
                return false;
            }

            return !in_array($item, $this->excludeController);
        });

        return $names;
    }

    /**
     * 将控制器文件路径转成类名
     * @param $module
     * @param $names
     * @return string[]
     */
    protected function formatController($module, $names)
    {
        $names = array_map(function ($item) use ($module) {
            $item = 'app\\' . str_replace([$this->appPath, '.php','/'], ['', '','\\'], $item);

            return $item;
        }, $names);

        return $names;
    }


}