<?php
/**
 * Created by PhpStorm.
 * User: 19248
 * Date: 2022/11/5
 * Time: 21:27
 */

namespace app\model\traits;

use app\model\BaseModel;
use think\Container;
use think\db\Query;
use think\helper\Str;

trait LangTrait
{
    /**
     * @var null 多语言模型名
     */
    protected $langModelName = null;

    /**
     * @var string 多语言模型关联字段
     */
    public $langRelationPk = 'target_id';

    /**
     * @var string 语言字段
     */
    public $langField = 'lang';

    /**
     * @var bool 多语言开关
     */
    protected $langStatus = false;

    public function getLangStatus()
    {
        return $this->langStatus;
    }

    /**
     * 关联搜索多语言的内容
     * @param Query $query
     * @param $field
     * @param $value
     * @param $op
     * @return void
     */
    public function searchRelationLang(Query $query, $field, $value, $op = 'like')
    {
        $array = is_array($field) ? $field : explode('|', $field);

        $name     = get_class_name(static::class);
        $langName = $this->getLangModelName();

        $allowLangFields = $this->getLangField();

        $fields     = [];
        $langFields = [];

        foreach ($array as $item) {
            $fields[] = "$name.$item";
            if (in_array($item, $allowLangFields)) {
                $langFields[] = "$langName.$item";
            }
        }

        $orFields     = join('|', $fields);
        $orLangFields = join('|', $langFields);
        $orAllFields  = join('|', array_merge($fields, $langFields));

        if ($langFields) {
            /*$query->hasWhere('langs', [
                [$orLangFields, $op, $value]
            ])->whereOr($orFields, $op, $value);*/
            $langWhere = $this->getLangModelObj()->queryWithTrashed();
            $query->hasWhere('langs', $langWhere, '*', 'LEFT')->where($orAllFields, $op, $value);
        } else {
            $query->where($orFields, $op, $value);
        }

    }

    /**
     * 获取当前语言
     * @return \think\model\relation\HasOne
     */
    public function language()
    {
        $default = \think\facade\Lang::defaultLangSet();
        $lang    = \think\facade\Lang::getLangSet();

        return $this->relationLang($lang);
    }

    /**
     * 获取所有语言的关联数据
     * @return \think\model\relation\HasMany
     */
    public function langs()
    {
        return $this->hasMany($this->getLangModelName(), $this->langRelationPk);
    }

    /**
     * 关联英语
     * @return \think\model\relation\HasOne
     */
    public function enUs()
    {
        return $this->relationLang(__FUNCTION__);
    }

    /**
     * 关联语言
     * @param $lang
     * @return \think\model\relation\HasOne
     */
    protected function relationLang($lang)
    {
        $lang = Str::snake($lang, '-');

        return $this->hasOne($this->getLangModelName(), $this->langRelationPk)->where($this->langField, $lang);
    }

    /**
     * 获取当前的语言模型
     * @return string|null
     */
    public function getLangModelName()
    {
        $name = $this->langModelName;

        if (!$name) {
            $name = get_class_name(static::class) . 'Lang';
        }

        return $name;
    }

    /**
     * 获取多语言字段
     * @return array
     */
    public function getLangField()
    {
        $fields = [];

        $langModel = $this->getLangModelObj();

        if ($langModel) {
            $fields = array_diff($langModel->getTableFields(), ['id', 'create_time', 'update_time', 'delete_time', $this->langField, $this->langRelationPk]);
            sort($fields);
        }

        return $fields;
    }

    /**
     * @return false|BaseModel
     */
    public function getLangModelObj()
    {
        static $obj;

        if (!$obj) {
            $name = '\app\model\\' . $this->getLangModelName();
            $obj  = Container::getInstance()->invokeClass($name);
        }

        return $obj;
    }
}
