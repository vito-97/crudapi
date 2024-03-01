<?php
declare (strict_types = 1);

namespace app;

use think\facade\App;
use think\model\relation\MorphToMany;
use think\Service;

/**
 * 应用服务类
 */
class AppService extends Service
{
    public function register()
    {
    }

    public function boot()
    {
        $this->setMorphMap();
    }

    /**
     * 更改多态多对多的类型名称
     * @return void
     */
    protected function setMorphMap()
    {
        //更改多态多对多的类型
        //效率低，没实例化一个模型就会进行设置
        /*Model::maker(function (Model $model) {
            $class = get_class($model);
            MorphToMany::morphMap([$class => get_class_name($class)]);
        });*/

        $map       = [];
        $namespace = 'app\\model\\';
        $models    = $this->getAllModel();
        foreach ($models as $name) {
            $map[$namespace . $name] = $name;
        }

        MorphToMany::morphMap($map);
    }

    /**
     * 获取所有模型名称
     * @return array|array[]|mixed|string[]
     */
    protected function getAllModel()
    {
        static $names;

        if (is_null($names)) {
            $path  = App::getAppPath() . 'model';
            $files = glob($path . '/*.php');

            $names = array_map(function ($file) {
                return pathinfo($file, PATHINFO_FILENAME);
            }, $files);
        }

        return $names;
    }
}
