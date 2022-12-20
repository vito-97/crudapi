<?php
declare (strict_types=1);

namespace app\logic;

use app\exception\MessageException;
use app\model\SystemConfig;
use app\validate\CustomRuleValidate;

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
    public function config($key = null, $default = '')
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

    /**
     * @param null $key 获取的键名
     * @param string $default 默认值
     * @return SystemConfig|SystemConfig[]|array|mixed|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function get($key = null, $default = '')
    {
        static $class;

        if (!$class) {
            $class = new static();
        }

        return $class->config($key, $default);
    }

    /**
     * 更新配置信息
     * @param array $data
     * @return SystemConfigLogic[]|array|\think\Collection
     * @throws MessageException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function updateConfigs($data = [])
    {
        if (empty($data)) {
            throw new MessageException('请传入更新配置内容');
        }

        $data = array_filter($data, function ($item) {
            return !is_null($item);
        });

        $keys = array_keys($data);

        $result = $this->where('key', 'IN', $keys)->select();

        $rules = $this->getRules($result);

        if ($rules) {
            CustomRuleValidate::batchCheck($data, $rules);
        }

        if ($result->isEmpty()) {
            throw new MessageException('查询不到相关配置信息');
        }

        $result->each(function ($item) use ($data) {
            $item->value = $data[$item->key];
            $item->save();
        });

        return $result;
    }

    /**
     * 获取验证规则
     * @param $result
     * @return array
     */
    public function getRules($result)
    {
        $rules = [];

        foreach ($result as $item) {
            if ($item->validate) {
                $rules["{$item['key']}|{$item['name']}"] = $item->validate;
            }
        }

        return $rules;
    }
}
