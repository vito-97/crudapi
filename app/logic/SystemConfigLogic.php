<?php
declare (strict_types=1);

namespace app\logic;

use app\model\SystemConfig;


class SystemConfigLogic extends BaseLogic
{
    protected static $configList;

    protected static $configs;

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return SystemConfig::class;
    }

    /**
     * 获取配置列表
     * @return SystemConfig[]|array|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getConfigList()
    {
        $config = self::$configList;

        if (is_null($config)) {
            $config = SystemConfig::scope('sort')->select();

            self::$configList = $config;
        }

        return $config;
    }

    /**
     * 获取分组的配置列表
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getConfigTree()
    {
        static $config;

        if (is_null($config)) {
            $result = $this->getConfigList();

            foreach ($result as $key => $item) {
                if (empty($config[$item->system_config_tab_id])) {
                    $config[$item->system_config_tab_id] = [];
                }

                $config[$item->system_config_tab_id][] = $item;
            }
        }

        return $config;
    }

    /**
     * 获取配置信息
     * @param null $key 获取的键名
     * @param string $default 默认值
     * @return SystemConfig|SystemConfig[]|array|mixed|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getConfigs($key = null, $default = '')
    {
        if (is_null(self::$configs)) {
            $config = $this->getConfigList();

            if (!$config->isEmpty()) {
                $config = $config->column('value', 'key');
            }

            self::$configs = $config;
        }

        return $key ? (!empty(self::$configs[$key]) ? self::$configs[$key] : $default) : self::$configs;
    }
}
