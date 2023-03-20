<?php
declare (strict_types = 1);

namespace app\logic;

use app\exception\MessageException;
use app\model\SystemConfig;
use app\model\SystemConfigLang;
use app\validate\CustomRuleValidate;
use think\facade\Config;
use think\facade\Lang;

class SystemConfigLogic extends BaseLogic
{
    protected static $configList;

    protected static $configLangList;

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
     * 获取多语言配置内容
     * @return SystemConfigLang[]|array|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getConfigLangList()
    {
        $config = self::$configLangList;

        if (is_null($config)) {
            $config = SystemConfigLang::select();

            self::$configLangList = $config;
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
     * @param null|string|array $key 获取的键名
     * @param string $default 默认值
     * @return SystemConfig|SystemConfig[]|array|mixed|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function config($key = null, $default = '')
    {
        $langStatus = $this->getLangStatus();
        $method     = __FUNCTION__;

        if (is_null(self::$configs)) {
            $config = $this->getConfigList();

            if (!$config->isEmpty()) {
                $config = $config->column('value', 'key');
            }

            if ($langStatus) {
                $configLang = $this->getConfigLangList();

                if (!$configLang->isEmpty()) {

                    foreach ($configLang as $item) {
                        $k                      = str_replace('-', '_', $item->lang);
                        $config[$k][$item->key] = $item->value;
                    }
                }
            }

            self::$configs = $config;
        }

        if (is_array($key)) {
            $data = [];
            foreach ($key as $alias => $name) {
                if (is_numeric($alias) || !$alias) {
                    $alias = $name;
                }
                if ($name) {
                    $data[$alias] = $this->$method($name);
                }
            }

            return $data;
        } else {
            if ($key && $langStatus && !is_default_lang_set()) {
                $lang   = str_replace('-', '_', Lang::getLangSet());
                $config = self::$configs[$lang] ?? [];

                if (!empty($config[$key])) {
                    return $config[$key];
                }
            }

            return $key ? (!empty(self::$configs[$key]) ? self::$configs[$key] : $default) : self::$configs;
        }
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


        $langData   = [];
        $langList   = Config::get('lang.lang_list');
        $langStatus = $this->getModel()->getLangStatus();

        foreach ($result as $item) {
            $item->value = $data[$item->key];
            $item->save();

            //需要多语言
            if ($langStatus && $item->lang) {
                foreach ($langList as $lang => $name) {
                    $k     = str_replace('-', '_', $lang) . '_' . $item->key;
                    $value = $data[$k] ?? null;
                    if (!is_null($value)) {
                        $langData[] = [
                            'key'   => $item->key,
                            'value' => $value,
                            'lang'  => $lang
                        ];
                    }
                }
            }
        }

        if ($langStatus && $langData) {
            (new SystemConfigLang)->replace()->saveAll($langData);
        }

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
