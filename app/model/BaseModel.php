<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:26
 */

namespace app\model;

use app\common\Enum;
use app\common\Message;
use app\exception\ErrorException;
use app\model\traits\LangTrait;
use think\db\BaseQuery;
use think\db\Query;
use think\facade\Lang;
use think\helper\Str;
use think\Model;
use think\model\concern\SoftDelete;
use think\Paginator;

abstract class BaseModel extends Model
{
    use SoftDelete;
    use LangTrait;

    protected $defaultSoftDelete = 0;

    //默认每页数量
    protected $defaultLimit = 20;

    protected $hidden = ['delete_time'];

    protected $append = ['status_desc'];

    const SWITCH_OFF = Enum::SWITCH_OFF;
    const SWITCH_ON  = Enum::SWITCH_ON;

    //开关可选项
    const SWITCH_ENUM = [
        self::SWITCH_OFF => Message::SWITCH_NO,
        self::SWITCH_ON  => Message::SWITCH_YES,
    ];

    //禁用状态
    const STATUS_OFF = 0;
    //启用状态
    const STATUS_ON = 1;

    //状态字段
    protected $statusEnum = [
        self::STATUS_OFF => Message::STATUS_OFF,
        self::STATUS_ON  => Message::STATUS_ON,
    ];

    //转换语言
    protected $convertEnumLang = [];

    protected $_dateFormat = 'Y-m-d H:i';

    /**
     * 查询范围
     * 全局查询范围无法加入参数
     * 故使用该字段
     * @var array
     */
    protected static $scope = [];

    /**
     * 全局查询范围
     * @var array
     */
    protected static $GlobalScope = [];

    /**
     * 是否使用查询范围
     * @var array
     */
    protected static $withScope = [];

    /**
     * 设置查询范围
     * @param array $scope
     * @param boolean $override
     */
    public static function setScope(array $scope = [], $override = false)
    {
        $name = class_basename(static::class);

        self::$scope[$name] = $override ? $scope : array_merge(self::$scope[$name] ?? [], $scope);
    }

    /**
     * 设置全局查询范围
     * @param array $scope
     * @param false $override
     * @return $this
     */
    public static function setGlobalScope(array $scope = [], $override = false)
    {
        self::$GlobalScope = $override ? $scope : array_merge(self::$GlobalScope, $scope);
    }

    /**
     * 是否使用查询范围
     * @param $status
     * @return $this
     */
    public static function withScope($status)
    {
        $name = class_basename(static::class);

        self::$withScope[$name] = $status;
    }

    /**
     * 重写DB
     * @param array $scope
     * @return BaseQuery
     */
    public function db($scope = []): BaseQuery
    {
        $query     = parent::db($scope); // TODO: Change the autogenerated stub
        $name      = class_basename(static::class);
        $s         = array_merge(self::$GlobalScope, self::$scope[$name] ?? []);
        $withScope = self::$withScope[$name] ?? true;

        //设置查询范围
        if ($s && $withScope) {

            foreach ($s as $key => $args) {

                if (is_numeric($key)) {
                    $key  = $args;
                    $args = null;
                }

                if (!$scope || !in_array($key, $scope)) {
                    $key = Str::studly($key);
                    $query->scope($key, $args);
                }
            }
        }

        return $query;
    }

    /**
     * 获取指定字段的可选值
     * @param $field
     * @return array|mixed
     */
    public function getFieldEnum($field)
    {
        $field = Str::camel($field);
        $enum  = $field . 'Enum';

        $result = $this->$enum ?? [];

        if (empty($this->convertEnumLang[$field])) {
            $this->convertEnumLang[$field] = true;
            $this->$enum                   = $result = $this->getLang($result);
        }


        return $result;
    }

    /**
     * 获取字段的enum值
     * @param $field
     * @param string|boolean $key
     * @return array|mixed
     */
    public function getEnum($field, $key = false)
    {
        $enum = $this->getFieldEnum($field);

        return false !== $key ? $enum[$key] ?? $key : $enum;
    }

    /**
     * 判断Enum是否存在
     * @param $field
     * @param string|boolean $key
     * @return bool
     */
    public function hasEnum($field, $key = false)
    {
        $enum = $this->getFieldEnum($field);

        if (empty($enum)) {
            throw new ErrorException("${field}字段没有enum");
        }

        if (is_array($key)) {
            foreach ($key as $index) {
                if (!$this->hasEnum($field, $index)) {
                    return false;
                }
            }

            return true;
        }

        return false !== $key ? isset($enum[$key]) : !!$enum;
    }

    /**
     * 获取开关
     * @return array
     */
    public function getSwitchEnum()
    {
        $result = $this->getLang(self::SWITCH_ENUM);

        return $result;
    }

    /**
     * 通过id获取数据
     * @param $id
     * @param array $args
     * @return BaseModel|array|mixed|Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getByID($id, $args = [])
    {
        $query = $this->getQuery($args);

        return $query->find((int)$id);
    }

    /**
     * 获取一条数据
     * @param array $args
     * @return BaseModel|array|mixed|BaseQuery|Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getOne($args = [])
    {
        $query = $this->getQuery($args);

        return $query->find();
    }

    /**
     * 新增数据
     * @param array $data
     * @param array $together
     * @return BaseModel|false
     */
    public function add(array $data, array $together = [])
    {
        $model = new static();
//        $model = $this;
        //必须先设置属性together才有效
        $model->setAttrs($data);

        $allowField = $args['allow_field'] ?? [];

        $status = $model->together($together)->allowField($allowField)->save();

        return $status ? $model : false;
    }

    /**
     * 通过ID更新数据
     * @param $id
     * @param array $data
     * @param array $args
     * @return array|false|mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function updateByID($id, $data = [], $args = [])
    {
        $together = $args['together'] ?? [];

        if (is_object($id)) {
            $obj = $id;
        } else {
            $obj = $this->getByID($id, $args);
            if (!$obj) {
                return false;
            }
        }

        $allowField = $args['allow_field'] ?? [];

        //先设置属性
        $obj->setAttrs($data);
        $status = $obj->together($together)->allowField($allowField)->save() ? $obj : false;

        if ($status) {
            // 关联更新之前没先关联会更新不上 所以需要获取相关内容进行更新
            foreach ($obj->relationWrite as $key => $name) {
                $value = $obj->getRelation($key);
                if (!$value) {
                    if (is_array($name)) {
                        $obj->$key()->save($name);
                    }
                }
            }
        }

        return $status;
    }

    /**
     * 通过ID删除数据
     * @param $id
     * @param array $args
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function deleteByID($id, $args = [])
    {
        $together = $args['together'] ?? [];
        $force    = $args['force'] ?? false;

        if (is_object($id)) {
            $obj = $id;
        } else {
            $obj = $this->getByID($id, $args);
            if (!$obj) {
                return false;
            }
        }

        $status = $obj->together($together)->force($force)->delete();

        return $status;
    }

    /**
     * 获取所有数据
     * @param array $args
     * @return BaseModel[]|array|\think\Collection|Paginator
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getAll($args = [])
    {
        $result = $this->getQuery($args, true);

        return $result;
    }

    /**
     * 获取查询模型
     * @param array $args
     * @param bool $select
     * @return BaseModel
     */
    public function getQuery($args = [], $select = false)
    {
        $args               = $this->parseArgs($args);
        $withoutGlobalScope = $args['without_global_scope']
            ?
            (is_array($args['without_global_scope']) ? $args['without_global_scope'] : []) : [];

        //获取模型名称
        $name = get_class_name(static::class);

        //获取query
        $query = $this->db($withoutGlobalScope);

        //设置上别名
        if ($args['alias']) {
            $alias = is_string($args['alias']) ? $args['alias'] : $name;
            $query->alias($alias);
        }

        //搜索器
        if ($args['with_search']) {
            $query = $query->withSearch(array_keys($args['with_search']), $args['with_search']);
        }

        //并条件
        if ($args['where']) {
            $query = $query->where($args['where']);
        }
        //IN条件
        if ($args['where_in']) {
            foreach ($args['where_in'] as $field => $value) {
                $query = $query->whereIn($field, $value);
            }
        }
        //或条件
        if ($args['where_or']) {
            $query = $query->whereOr($args['where_or']);
        }
        // having
        if ($args['having']) {
            $query = $query->having($args['having']);
        }
        //分组
        if ($args['group']) {
            $query = $query->group($args['group']);
        }
        //设置字段
        if ($args['field']) {
            //排除字段
            if ($args['without_field']) {
                $query = $query->withoutField($args['field']);
            } else {
                $query = $query->field($args['field']);
            }
        }
        //关联
        if ($args['with']) {
            $query = $query->with($args['with']);
        }

        //关联统计
        if ($args['with_count']) {
            $query = $query->withCount($args['with_count'], $args['with_count_sub_query']);
        }

//        if ($args['together']) {
//            $query = $query->together($args['together']);
//        }
        //需要调用query去回调查询
        if ($args['query'] && is_array($args['query'])) {

            foreach ($args['query'] as $queryFn) {
                if (is_callable($queryFn) || is_array($queryFn)) {
                    call_user_func($queryFn, $query);
                }
            }

        }
        //显示sql
        if ($args['fetch_sql']) {
            $query = $query->fetchSql(true);
        }
        //查询范围
        if ($args['scope']) {
            $query = $query->scope($args['scope']);
        }
        //排序
        if ($args['order']) {
            $query = $query->order($args['order']);
        }
        if ($args['cache']) {
            if (is_array($args['cache'])) {
                $query = $query->cache(...$args['cache']);
            } else {
                $query = $query->cache($args['cache']);
            }
        }
        //需要直接查询
        if ($select) {
            //需要分页
            if ($args['paginate'] && !$args['fetch_sql']) {
                $query = $query->paginate(['page' => (int)$args['page'], 'list_rows' => (int)$args['limit']], $args['simple']);
            } else {
                //分页
                if ($args['page'] && $args['limit']) {
                    $query = $query->page((int)$args['page'], (int)$args['limit']);
                } elseif ($args['limit']) {
                    $query = $query->limit((int)$args['limit']);
                }
                $query = $query->select();
            }
        }

        return $query;
    }

    /**
     * 解析参数
     * @param $args
     * @return array
     */
    protected function parseArgs($args)
    {
        //已经解析过了
        if ($this->isParsed($args)) {
            return $args;
        }

        $default = [
            //true改成了false
            'alias'                => false,
            'having'               => null,
            'where'                => null,
            'where_or'             => null,
            'where_in'             => '',
            'group'                => null,
            'order'                => null,
            'field'                => [],
            'without_field'        => false,
            'with'                 => null,
            'with_count'           => null,
            'with_count_sub_query' => true,
            'page'                 => 0,
            'limit'                => $this->defaultLimit,
            'paginate'             => false,
            'simple'               => false,
            'with_search'          => null,
            'query'                => [],
            'scope'                => null,
            'together'             => [],//关联操作
            'without_global_scope' => [],
            'fetch_sql'            => false,
            'cache'                => false,
        ];

        $args = array_merge($default, $args);

        //where里自动转搜索
        $where = $args['where'];
        if ($where) {
            foreach ($where as $field => $value) {
                $method = 'search' . Str::studly($field) . 'Attr';

                if (method_exists($this, $method)) {
                    $args['with_search'][$field] = filter_like_char($value);
                    unset($args['where'][$field]);
                }
            }
        }

        //转换查询范围
        if ($args['scope']) {
            foreach ($args['scope'] as &$scope) {
                $scope = Str::studly($scope);
            }
        }

        return $this->setParsed($args);
    }

    /**
     * 状态搜索器
     * @param $query
     * @param $value
     * @param $data
     */
    public function searchStatusAttr($query, $value, $data)
    {
        $this->_searchAttr(__FUNCTION__, $query, $value, $data);
    }

    /**
     * 获取所有下级的Id
     * @param $pid
     * @param boolean $withPid
     * @param string $parentKey
     * @return array
     */
    public function getChildrenID($pid, $withPid = false, $parentKey = 'pid')
    {
        $sql = $this->getChildrenIDSql($pid, $withPid, $parentKey);

        $result = $this->withTrashed()->table($sql . ' as t')->column('t.id');

        return $result;
    }

    /**
     * 获取无限极分类的父类所有下级ID SQL
     * @param $pid
     * @param boolean $withPid
     * @param string $parentKey
     * @return string
     */
    public function getChildrenIDSql($pid, $withPid = false, $parentKey = 'pid')
    {
        $table = $this->getTable();

        $pidSql = $withPid ? '' : "AND t2.id != {$pid}";

        $sql = "(SELECT t2.id
                    FROM(
                        SELECT
                            @ids AS parent_ids,
                            (SELECT @ids := GROUP_CONCAT(id) FROM {$table} WHERE FIND_IN_SET({$parentKey}, @ids)) AS children_ids,
                            @l := @l+1 AS LEVEL
                         FROM {$table}, (SELECT @ids := '{$pid}', @l := 0 ) b
                         WHERE @ids IS NOT NULL
                        ) t1
                    JOIN {$table} t2
                    ON FIND_IN_SET(t2.id, t1.parent_ids)  {$pidSql})";

        return $sql;
    }

    /**
     * 公共的搜索器处理
     * @param $name
     * @param $query
     * @param $value
     * @param $data
     */
    protected function _searchAttr($name, $query, $value, $data)
    {
        if (0 === strpos($name, 'search')) {
            $rule = '#search(?<field>\w*?)Attr#';
            preg_match($rule, $name, $match);
            $field = $match['field'] ?? $name;
        } else {
            $field = $name;
        }

        $snakeField = Str::snake($field);

        //数组
        if (is_array($value)) {
            $enum = array_keys($this->getFieldEnum($field));
            if ($enum) {
                //获取交集
                $v     = array_intersect($value, $enum);
                $value = $v ?: $value;
            }
        }

        $query->where($snakeField, $value);
    }

    /**
     * 判断是否已经被解析
     * @param array $args
     * @return bool
     */
    private function isParsed($args = [])
    {
        return !empty($args['_is_parse']);
    }

    /**
     * 设置已经解析字段
     * @param array $args
     * @return array|mixed
     */
    private function setParsed($args = [])
    {
        $args['_is_parse'] = true;
        return $args;
    }

    protected function setCreateTimeAttr($value)
    {
        return $this->_setTimeAttr($value);
    }

    protected function setUpdateTimeAttr($value)
    {
        return $this->_setTimeAttr($value);
    }

    /**
     * 数组转字符串
     * @param $value
     * @param string $char
     * @return string
     */
    protected function setArrayToStringAttr($value, $char = ',')
    {
        if (!is_string($value)) {
            sort($value);
            $value = join($char, $value);
        }

        return $value;
    }

    /**
     * 获取时间
     * @param $value
     * @param string $format
     * @return false|mixed|string
     */
    protected function _getTimeAttr($value, $format = 'Y-m-d H:i:s')
    {
        if ($value) {
            if (is_numeric($value)) {
                $value = date($format, $value);
            }
        }

        return $value ?: '';
    }

    /**
     * 设置时间
     * @param $value
     * @param bool|string $format
     * @return false|int|mixed|string
     */
    protected function _setTimeAttr($value, $format = false)
    {
        if ($value) {
            if (!is_numeric($value)) {
                $value = strtotime($value);
            }

            if ($format === 'start') {
                $value = strtotime(date('Y-m-d 00:00:00', $value));
            } elseif ($format === 'end') {
                $value = strtotime(date('Y-m-d 23:59:59', $value));
            }
        }

        return $value;
    }

    /**
     * 检测模型是否有数据
     * @param string $field
     * @return $this
     * @throws ErrorException
     */
    protected function checkModelData($field = 'id')
    {

        if (!$this->getData($field)) {
            throw new ErrorException(static::class . '模型未设置数据');
        }

        return $this;
    }

    /**
     * 排序
     * @param Query $query
     */
    public function scopeSort(Query $query)
    {
        $query->order(['sort' => 'desc', 'id' => 'desc']);
    }

    /**
     * 正常状态
     * @param Query $query
     * @return Query
     */
    public function scopeStatus(Query $query)
    {
        $query->where('status', self::STATUS_ON);
    }

    /**
     * 用户查询范围
     * @param Query $query
     * @param int $id 用户
     */
    public function scopeUser(Query $query, $id)
    {
        $this->scopeFiled($query, 'user_id', $id);
    }

    /**
     * 指定字段需要查询范围
     * @param Query $query
     * @param $field
     * @param $value
     */
    protected function scopeFiled(Query $query, $field, $value)
    {
        $fields = $query->getTableFields();
        if (in_array($field, $fields)) {
            $query->where($field, is_array($value) ? 'IN' : '=', $value);
        }
    }

    public function isOnStatus()
    {
        return self::STATUS_ON === $this->getData('status');
    }

    public function isOffStatus()
    {
        return self::STATUS_OFF === $this->getData('status');
    }

    /**
     * 获取状态描述
     * @param $value
     * @param $data
     * @return array|mixed|string
     */
    protected function getStatusDescAttr($value, $data)
    {
        return $this->getEnumDesc('status', $data);
    }

    /**
     * 获取enum字段的描述
     * @param $key
     * @param $data
     * @return array|mixed|string
     */
    protected function getEnumDesc($key, $data)
    {
        if (preg_match('/get(\w*?)DescAttr/', $key, $match)) {
            $key = Str::snake($match[1]);
        }

        return $this->getEnum($key, $data[$key] ?? '');
    }

    /**
     * 获取语言
     * @param $data
     * @return array|mixed
     */
    protected function getLang($data)
    {
        if (is_array($data)) {
            foreach ($data as $key => $value) {
                $data[$key] = Lang::get($value);
            }
            return $data;
        } else {
            return Lang::get($data);
        }
    }

    /**
     * 获取多语言内容
     * @param $name
     * @return mixed
     */
    public function _($name)
    {
        $field = $this->getLangField();
        $lang  = str_replace('-', '_', Lang::getLangSet());

        if ($this->isExists() && $this->getLangStatus() && in_array($name, $field) && !is_default_lang_set()) {
            $relation = $this->$lang;
            if ($relation) {
                $value = $relation->getAttr($name);

                if ($value) {
                    return $value;
                }
            }
        }

        return $this->getAttr($name);
    }
}
