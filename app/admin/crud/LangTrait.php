<?php
/**
 * Created by PhpStorm.
 * User: 19248
 * Date: 2022/11/6
 * Time: 1:06
 */

namespace app\admin\crud;

use app\model\BaseModel;
use think\facade\Config;
use think\facade\Lang;
use think\helper\Str;

trait LangTrait
{
    /**
     * 设置label
     * @return $this
     */
    public function setLangLabel()
    {
        if ($this->langStatus()) {
            $this->_labelCallback['get_lang_list_label']  = ['name' => '语言列表', 'field' => 'lang_list', 'key' => 'lang_list'];
            $this->_labelCallback['get_lang_field_label'] = ['name' => '语言字段', 'field' => 'lang_field', 'key' => 'lang_field'];
        }

        return $this;
    }

    public function setLangWithLang()
    {
        $langWith = $this->getLangWith();
        $with     = [];
        foreach ($this->with as $key => $name) {
            $modelName = $name;
            if (!is_numeric($key)) {
                $modelName = $key;
            }

            try {
                /**
                 * @var $model BaseModel
                 */
                $model = model($modelName);
            } catch (\Throwable $e) {
                continue;
            }

            //已经开启了多语言了
            if ($model->getLangStatus()) {
                //删除了该关联
                unset($this->with[$key]);

                if (is_numeric($key)) {
                    $with[$name] = $langWith;
                } else {
                    if (!is_array($name)) {
                        $name = explode(',', $name);
                    }

                    $with[$key] = array_merge($name, $langWith);
                }
            }
        }

        if ($with) {
            $this->with = array_merge($this->with, $with);
        }

        return $this;
    }

    /**
     * 设置关联
     * @param bool $withOther 是否再判断关联里的模型是否需要关联多语言
     * @return $this
     */
    public function setLangWith($withOther = false)
    {
        if ($withOther) {
            $this->setLangWithLang();
        }

        if ($this->langStatus()) {
            $this->with = array_merge($this->with, $this->getLangWith());
        }

        return $this;
    }

    protected function getLangWith()
    {
        static $with = [];

        if (!$with) {
            $list    = Config::get('lang.lang_list');
            $default = Lang::defaultLangSet();
            foreach ($list as $lang => $name) {
                if ($lang !== $default) {
                    $with[] = str_replace('-', '_', strtolower($lang));
                }
            }
        }

        return $with;
    }

    /**
     * 设置多语言数据内容
     * @param array $params
     * @param BaseModel $model
     * @return $this
     */
    public function setLangTogether(array &$params, $model = null)
    {
        if ($this->langStatus()) {
            $list    = Config::get('lang.lang_list');
            $default = Lang::defaultLangSet();
            $field   = $this->getLangFieldLabel();
            foreach ($list as $lang => $name) {
                if ($lang !== $default) {
                    $key         = str_replace('-', '_', strtolower($lang));
                    $relationKey = Str::camel($key);

                    $isSet    = false;
                    $relation = null;
                    if ($model) {
                        $relation = $model->$relationKey;
                    }
                    // 获取语言参数
                    foreach ($field as $i) {
                        $k     = $key . '_' . $i;
                        $value = $relation[$i] ?? '';
                        if (isset($params[$k])) {
                            $langParams[$i] = $params[$k];
                            unset($params[$k]);
                        } else {
                            $langParams[$i] = $value;
                        }

                        if ($langParams[$i] && !$isSet) {
                            $isSet = true;
                        }
                    }
                    //有数据
                    if ($isSet) {
                        $langParams['lang']           = $lang;
                        $this->together[$relationKey] = $langParams;
                    } else {
                        if ($relation) {
                            $relation->force()->delete();
                        }
                    }
                }
            }
        }
        return $this;
    }

    public function getLangListLabel()
    {
        return Config::get('lang.lang_list');
    }

    public function getLangFieldLabel()
    {
        $model = $this->getModelObj();

        return $model->getLangField();
    }

    /**
     * @return false|BaseModel
     */
    public function getLangModelObj()
    {
        $model = $this->getModelObj();

        return $model->getLangModelObj();
    }

    public function langStatus()
    {
        $model = $this->getModelObj();

        $langStatus = $model->getLangStatus() ?? false;

        return $langStatus;
    }

    /**
     * 获取模型对象
     * @return BaseModel|null
     */
    private function getModelObj()
    {
        $model = null;

        if (!$model) {
            /**
             * @var $model BaseModel
             */
            $model = $this->getLogic()->getModel();
        }

        return $model;
    }
}
