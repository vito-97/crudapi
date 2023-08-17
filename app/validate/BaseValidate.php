<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/1/21
 */

namespace app\validate;

use app\common\Enum;
use app\exception\ErrorException;
use app\exception\DataNotFoundException;
use app\exception\ValidateException;
use app\common\Message;
use app\model\BaseModel;
use app\model\User;
use think\Container;
use think\facade\Db;
use think\facade\Lang;
use think\facade\Request;
use think\helper\Str;
use think\Validate;

abstract class BaseValidate extends Validate
{
    /**
     * 是否已经设置字段语言
     * @var bool
     */
    protected $isSetFieldLang = false;

    //多语言的字段分组
    protected $langFieldGroup = 'valid';

    //验证所有字段
    const VALID_ALL_FIELD = 'all';

    protected $checkHasWhere = [];

    const SAVE_SCENE   = Enum::VALID_SAVE_SCENE;
    const UPDATE_SCENE = Enum::VALID_UPDATE_SCENE;
    const LIST_SCENE   = Enum::VALID_LIST_SCENE;
    const CREATE_SCENE = Enum::VALID_CREATE_SCENE;
    const DETAIL_SCENE = Enum::VALID_DETAIL_SCENE;

    /**
     * 批量验证
     * @param array|string $data
     * @param string $scene
     * @return bool
     * @throws ValidateException
     */
    public static function batchCheck($data = [], $scene = '')
    {
        if (is_string($data)) {
            $scene = $data;
            $data  = [];
        }

        $rule = [];

        //第二参数是数组则默认设置成规则
        if (is_array($scene)) {
            $rule  = $scene;
            $scene = '';
        }

        $params = Request::param();

        if (is_array($data) && $data) {
            $params = array_merge($params, $data);
        }

        /**
         * @var $class Validate
         */
        $class = Container::getInstance()->invokeClass(static::class);

        $status = $class->setFieldLang()->setSceneField()->batch()->rule($rule)->scene($scene)->check($params);

        if (!$status) {
            $error = $class->getError();

            $msg = is_array($error) ?
                implode("\r\n", $error) : $error;

            $result = [
                'msg'  => $msg,
                'data' => $error,
            ];

            $exception = new ValidateException($result);

            throw $exception;
        } else {
            return true;
        }
    }

    /**
     * 通过验证规则获取数据
     * @param array|string $default
     * @param null $scene
     * @return array
     * @throws DataNotFoundException
     */
    public static function getDataByRule($default = [], $scene = null)
    {
        if (is_string($default)) {
            $scene   = $default;
            $default = [];
        }

        $data = [];

        /**
         * @var $class Validate
         */
        $class = Container::getInstance()->invokeClass(static::class);

        if ($scene && !isset($class->scene[$scene])) {
            $name = basename(static::class);
            $msg  = "未定义[$name]验证器场景[$scene]";
            throw new DataNotFoundException($msg);
        }

        $class->setFieldLang();

        $rules = $scene ? $class->scene[$scene] : $class->rule;

        if ('all' === $rules) {
            $rules = $class->rule;
        }

        foreach ($rules as $key => $value) {
            [$k] = $info = explode('|', is_string($key) ? $key : $value);
            $n        = $info[1] ?? $k;
            $data[$k] = Request::param($k, $default[$k] ?? '');
        }

        return $data;
    }

    /**
     * 更新场景
     */
    public function sceneUpdate()
    {
        $this->only($this->getSceneOnly(__FUNCTION__));
        $this->removeOnlyRule();
    }

    /**
     * 列表场景
     */
    public function sceneList()
    {
        $this->only($this->getSceneOnly(__FUNCTION__));
        $this->removeOnlyRule();
    }

    /**
     * 验证是否为不为0的正整数
     * @param $value
     * @return bool|string
     */
    protected function isPositiveInteger($value, $rule = '', $data = [], $field = '')
    {
        if (is_numeric($value)) {
            $num = $value + 0;
        } else {
            if (preg_match('/[^\d]/', $value)) {
                return ':attribute不是整数数字';
            }
            $num = (int)$value;
        }
        $n = 1;
        if ($rule === 'zero') {
            $n = 0;
        }
        if (is_numeric($value) && is_int($num) && $num >= $n) {
            return true;
        }
        return ':attribute必须是正整数';
    }

    /**
     * 检测数组式的ID
     * @param $value
     * @return bool|string
     */
    protected function checkIDArray($value, $rule = '', $data = [], $field = '')
    {
        if (is_string($value)) {
            $ids = explode(',', $value);
        } else {
            $ids = (array)$value;
        }

        foreach ($ids as $id) {
            $status = $this->isPositiveInteger($id);

            if (true !== $status) {
                return $status;
            }
        }

        return true;
    }

    /**
     * 检测是否存在
     * @param $value
     * @param string $rule
     * @param array $data
     * @param string $field
     * @return bool|string
     * @throws ErrorException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function checkHasCanEmpty($value, $rule = '', $data = [], $field = '')
    {
        if (!$value) {
            return true;
        }

        return $this->checkHas($value, $rule, $data, $field);
    }

    /**
     * 检测唯一，用的模型检测，会排除伪删除的数据
     * @param $value
     * @param $rule
     * @param $data
     * @param $field
     * @return string|true
     * @throws ErrorException
     */
    protected function checkUnique($value, $rule = '', $data = [], $field = '')
    {
        if (!$rule) {
            $rule = Str::snake(str_replace('Validate', '', get_class_name(static::class)));
        }

        $array = explode(',', $rule);
        $name  = $array[0];
        $field = $array[1] ?? $field;

        $model = model($name);

        $exists = $model->where($field, $value)->value($field);

        return $exists ? ':attribute has exists' : true;
    }

    /**
     * 检测数据是否存在于数据库里
     * @param $value
     * @param string $rule
     * @param array $data
     * @param string $field
     * @return bool|string
     * @throws ErrorException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function checkHas($value, $rule = '', $data = [], $field = '')
    {
        /*        if (empty($rule)) {
                    throw new ErrorException('checkHas 必须传入验证规则');
                }*/

        if ($rule) {
            $array = explode(',', $rule);
            $names = explode('/', $array[0]);
        } else {
            $names = [substr($field, 0, -3)];
        }

        $value = is_array($value) ? $value : array_filter(array_map(function ($it) {
            return intval($it);
        }, explode(',', $value)));

        foreach ($names as $name) {
            $model = model($name);
            $pk    = $array[1] ?? 'id';

            if ($pk === 'id' && !$value) {
                return '请先选择 :attribute';
            }

            // 循环检测多个ID
            foreach ($value as $id) {
                $where = $this->checkHasWhere[$field] ?? [];

                if (is_string($where) && method_exists($this, $where)) {
                    $where = $this->$where($name);

                    if (!is_array($where)) {
                        $where = [];
                    }
                }

                $where = array_merge($where, [$pk => $id]);

                $has = $model
                    ->field($pk)->where($where)
                    ->cache(60)->useSoftDelete('delete_time', ['=', 0])->find();

                if (!$has) {
                    return ":attribute 选择的ID:{$id}数据不存在";
                }
            }
        }

        return true;
    }

    /**
     * 检测是否在开关中
     * @param $value
     * @return bool|string
     */
    protected function checkSwitch($value)
    {
        $switch = array_keys(BaseModel::SWITCH_ENUM);
        return in_array($value, $switch) ? true : sprintf(':attribute must be in [%s]', join(',', $switch));
    }

    /**
     * 检测可选值
     * @param $value
     * @param string $rule
     * @param array $data
     * @param string $field
     * @return bool|string
     */
    protected function checkEnum($value, $rule = '', $data = [], $field = '')
    {
        $modelName = $rule ?: substr((new \ReflectionClass($this))->getShortName(), 0, -8);

        $modelClass = 'app\model\\' . $modelName;

        /**
         * @var BaseModel $model
         */
        $model = new $modelClass;

        $enum = $model->getFieldEnum($field);

        if (!$enum) return true;

        return $model->hasEnum($field, $value) ? true : Lang::get(Message::ENUM_VALUE_ONT_IN, [join(',', array_keys($enum))]);
    }

    /**
     * 检查传入的id集合
     * @param $value
     * @param $rule
     * @return bool|string
     */
    protected function checkIds($value, $rule)
    {
        if (!is_array($value)) {
            $values = explode(',', $value);
        } else {
            $values = $value;
        }

        if (empty($values)) {
            return ':attribute不能为空1';
        }

        foreach ($values as $id) {
            if (true !== $this->isPositiveInteger($id)) {
                return ':attribute里必须是正整数';
            }
        }

        return true;
    }

    protected function isNotEmpty($value, $rule = '', $data = '', $field = '')
    {
        if (empty($value)) {
            return ':attribute不允许为空';
        } else {
            return true;
        }
    }

    /**
     * 校验密码规则
     * @param $value
     * @return false|int
     */
    protected function checkPassword($value)
    {
        $rule = '/^(?=.*\d)(?=.*[a-zA-Z]).{6,10}$/';
        return !!preg_match($rule, $value);
    }

    /**
     * 设置字段的语言 多语言
     * @return $this
     */
    protected function setFieldLang()
    {
        if ($this->isSetFieldLang) return $this;
        $this->isSetFieldLang = true;

        //遍历字段别名
        foreach ($this->field as $key => &$value) {
            $k = $this->getLangField($value);
            if (Lang::has($k)) {
                $value = Lang::get($k);
            }
        }

        //遍历验证规则
        $rules = [];
        foreach ($this->rule as $key => $rule) {
            if (strpos($key, '|')) {
                [$field, $name] = explode('|', $key);

                $k = $this->getLangField($name);
                if (Lang::has($k)) {
                    $lang = Lang::get($k);
                    $key  = $field . '|' . $lang;
                }
            } else {
                $k = $this->getLangField($key);
                if (Lang::has($k)) {
                    $lang = Lang::get($k);
                    $key  = $key . '|' . $lang;
                }
            }

            $rules[$key] = $rule;
        }

        $this->rule = $rules;

        return $this;
    }

    /**
     * 获取语言下标
     * @param $field
     * @return string
     */
    protected function getLangField($field)
    {
        if ($this->langFieldGroup) {
            return 0 === strpos($field, $this->langFieldGroup . '.') ? $field : $this->langFieldGroup . '.' . $field;
        }

        return $field;
    }

    /**
     * 设置场景字段
     * @return $this
     */
    protected function setSceneField()
    {
        foreach ($this->scene as $key => $value) {
            if (is_string($value) && self::VALID_ALL_FIELD === $value) {
                $this->scene[$key] = $this->getAllField();
            }
        }

        return $this;
    }

    /**
     * 获取所有需要验证的字段
     * @return mixed|string
     */
    protected function getAllField()
    {
        static $fields = [];

        if (!$fields) {
            foreach ($this->rule as $key => $value) {
                [$field] = explode('|', $key);
                $fields[] = $field;
            }
        }

        return $fields;
    }

    /**
     * 获取场景名称
     * @param $name
     * @return string
     */
    protected function getSceneName($name)
    {
        return Str::snake(str_replace('scene', '', $name));
    }

    /**
     * 获取场景需要的字段
     * @param $name
     * @return array|mixed
     */
    protected function getSceneOnly($name)
    {
        $name = $this->getSceneName($name);
        return $this->scene[$name] ?? [];
    }

    /**
     * 移除需要验证的字段的指定验证规则
     * @param array $fields
     * @param string $rule
     * @return $this
     */
    protected function removeOnlyRule($fields = [], $rule = 'require|requireCallback')
    {
        $fields = $fields ?: $this->only;
        foreach ($fields as $field) {
            $this->remove($field, $rule);
        }

        return $this;
    }

    protected function isUrl($value)
    {
        return $value[0] === '/' || filter_var($value, FILTER_VALIDATE_URL);
    }
}
