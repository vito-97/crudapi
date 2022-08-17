<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 10:15
 */
declare(strict_types=1);

namespace app\common\curd;


use app\exception\DataInoperableException;
use app\exception\EmptyParamsException;
use app\exception\ErrorException;
use app\logic\BaseLogic;
use app\service\user\BaseUserService;
use think\App;
use think\Container;
use think\db\Query;
use think\helper\Str;
use think\Model;

abstract class BaseCurd
{
    /**
     * 验证器验证方法
     */
    const VALIDATE_METHOD_CHECK = 'batchCheck';

    /**
     * 验证器的获取数据方法
     */
    const VALIDATE_METHOD_DATA = 'getDataByRule';

    /**
     * 使用全局查询范围
     * @var bool
     */
    protected $withoutGlobalScope = false;

    /**
     * 验证器集合
     * @var array
     */
    protected $validate = [];

    /**
     * @var array 字段
     */
    protected $field = [];

    protected $order = ['id' => 'desc'];

    /**
     * 追加获取对象的字段
     * 更新的时候有用
     * @var array
     */
    protected $appendField = ['id'];

    /**
     * @var bool 是否排除字段
     */
    protected $withoutField = false;

    /**
     * @var array where条件
     */
    protected $where = [];

    /**
     * @var array where or条件
     */
    protected $whereOr = [];

    /**
     * @var 关联
     */
    protected $with = [];

    /**
     * @var array 关联统计
     */
    protected $withCount = [];

    /**
     * @var 查询范围
     */
    protected $scope;

    /**
     * @var 关联操作
     */
    protected $together = [];

    /**
     * 数据
     * @var array
     */
    protected $data = [];

    /**
     * @var BaseLogic
     */
    protected $logic;

    /**
     * @var object|App
     */
    protected $app;
    /**
     * @var \think\Request
     */
    protected $request;

    protected $queryStatus;

    /**
     * @var bool 调试sql
     */
    protected $fetchSql = false;

    /**
     * @var string[] 查询需要用到的属性
     */
    protected $queryArgs = ['field', 'where', 'whereOr', 'with', 'scope', 'withoutField', 'order'];

    /**
     * 需要自动获取的参数名
     * @var string[]
     */
    protected $paramsName = ['id'];

    /**
     * @var array 获取的参数
     */
    protected $params = [];

    /**
     * 获取参数时排除的参数
     * @var array
     */
    protected $getParamsExcept = ['id', 'lang', 'api_version', '_label', 'with_label'];

    /**
     * @var array 追加设置的数据
     */
    protected $appendParams = [];

    /**
     * @var array 排除的ID
     */
    protected $exclude = [];

    protected $obj = [];

    /**
     * @var string 模型场景值
     */
    protected $scene = '';

    /**
     * @var array 需要追加数据的字段
     */
    protected $append = [];

    /**
     * @var array 需要隐藏的字段
     */
    protected $hidden = [];

    /**
     * @var array 需要显示的字段
     */
    protected $visible = [];

    /**
     * 需要调用的方法
     * 方法是值 返回的数据会通过方法名存储到数据里
     * 传入字符串键将会设置成数据集合的别名
     * 支持依赖注入
     *
     * ！！！！废弃，改用label
     *
     * @var array
     */
    protected $appendCallback = [];

    /**
     * 标签回调
     * 获取的数据将设置到label键中
     * 'methodName' => ['name' => '用户','key' => 'user','field'=>'user_id']
     * @var array
     */
    protected $labelCallback = [];

    /**
     * 记录是否已经执行
     * @var bool
     */
    protected $isRun = false;

    //携带用户参数
    protected $withUser = false;

    //用户ID
    protected $userID = 0;

    //表里的用户字段
    protected $userField = 'admin_id';

    //执行中间件
    const MIDDLEWARE = ['validateMiddleware'];
    protected $_middleware = [];
    protected $middleware = [];

    //初始化中间件
    const INIT_MIDDLEWARE = ['_init', 'init'];
    protected $_init = [];
    protected $init = [];

    //可选的条件参数
    const OP = [
        '=', '<>',
        'LIKE', 'NOT LIKE',
        '>', '>=', '<', '<=',
        'FIND IN SET', 'FIND IN', 'FINDINSET',
        'IN', 'NOT IN',
        'BETWEEN', 'NOT BETWEEN',
        'RANGE', 'NOT RANGE',
        'NULL', 'IS NULL', 'NOT NULL', 'IS NOT NULL',
    ];

    const DEFAULT_OP = '=';

    /**
     * @var BaseUserService
     */
    protected $user;

    /**
     * 初始化
     * BaseCurd constructor.
     */
    public function __construct()
    {
        $this->app     = app();
        $this->request = $this->app->request;
        $this->user    = $this->request->getUser();
        $this->params  = $this->request->only($this->paramsName);

        $this->then($this->getInitMiddleware(), function () {
            return 'ok';
        });
    }

    /**
     * 二级类初始化
     */
    protected function _init($next)
    {
        $response = $next();
        return $response;
    }

    /**
     * 三级类初始化
     */
    protected function init($next)
    {
        $response = $next();
        return $response;
    }

    /**
     * 外部执行
     * @return $this
     */
    public function run()
    {
        if (!$this->isRun) {
            $this->isRun = true;
            $this->then($this->getQueryMiddleware(), function () {
                return $this->queryStatus = $this->query();
            });

        }

        return $this;
    }

    /**
     * 获取管道回调函数
     * 执行中间件
     * @param array $middleware
     * @param mixed $call
     * @return mixed
     */
    protected function pipeline($middleware, $call)
    {
        $pipeline = array_map(function ($call) {
            return function ($next, ...$params) use ($call) {
                //执行中间件
                if (method_exists($this, $call)) {
                    $response = call_user_func([$this, $call], $next, ...$params);
                } else if (is_callable($call)) {
                    $response = call_user_func($call, $next, ...$params);
                } else {
                    throw new ErrorException('中间件不是一个方法或函数' . (is_string($call) ? "[$call]" : ''));
                }

                if (empty($response)) {
                    throw new ErrorException('CURD中间件未返回' . (is_string($call) ? "[$call]" : ''));
                }

                return $response;
            };
        }, $middleware);

        return array_reduce(
            array_reverse($pipeline),
            function ($stack, $pipe) use ($pipeline) {
                return function (...$params) use ($stack, $pipe) {
                    $response = $pipe($stack, ...$params);
                    return $response;
                };
            },
            $call
        );

    }


    /**
     * 执行中间件
     * @param array $middleware
     * @param $call
     * @param mixed $params
     * @return mixed
     */
    protected function then(array $middleware, $call, ...$params)
    {
        $callback = $this->pipeline($middleware, $call);

        return $callback(...$params);
    }

    /**
     * 获取执行的中间件
     * @return array
     */
    protected function getQueryMiddleware()
    {
        return array_merge(self::MIDDLEWARE, $this->_middleware, $this->middleware);
    }

    /**
     * 获取初始化中间件
     * @return array
     */
    protected function getInitMiddleware()
    {
        return array_merge(self::INIT_MIDDLEWARE, $this->_init, $this->init);
    }

    /**
     * 获取查询参数
     * @return array
     */
    protected function buildParams($params = [])
    {
        $params     = $params ?: $this->request->param();
        $tableField = $this->getLogic()->getTableFields();
        $pk         = $this->getLogic()->getPk();

        //需要排序
        if (!empty($params['order'])) {
            //排序
            $order_key = $params['order'] ?? $pk;
            $sort      = $params['sort'] ?? 'DESC';

            if (!in_array($order_key, $tableField)) {
                $order_key = $pk;
            }

            $order = [$order_key => $sort];
        }

        $filters = $this->getJsonParams('filter', $params);
        $ops     = $this->getJsonParams('op', $params);

        $where = [];


        foreach ($filters as $field => $value) {
            //获取逻辑操作符
            $op = strtoupper($ops[$field] ?? self::DEFAULT_OP);
            if (!in_array($op, self::OP)) {
                $op = self::DEFAULT_OP;
            }

            $value = !is_array($value) ? trim($value) : $value;

            //null和空字符串特殊处理
            if (!is_array($value)) {
                if (in_array(strtoupper($value), ['NULL', 'NOT NULL'])) {
                    $op = strtoupper($value);
                }
                //如果是引号没内容 则查找空字符串的
                if (in_array($value, ['""', "''"])) {
                    $value = '';
                    $op    = '=';
                }
            }

            if (in_array($field, $tableField)) {
                //相等或不等
                if (in_array($op, ['=', '<>'])) {

                    $where[] = [$field, $op, (string)$value];

                    //模糊查询
                } else if (in_array($op, ['LIKE', 'NOT LIKE',])) {

                    $where[] = [$field, $op, '%' . filter_like_char((string)$value) . '%'];

                    //大小比较
                } else if (in_array($op, ['>', '>=', '<', '<='])) {

                    $where[] = [$field, $op, (int)$value];

                    //查找字符串
                } else if (in_array($op, ['FIND IN SET', 'FIND IN', 'FINDINSET'])) {

                    $value = $this->valueToArray($value);

                    if ($value) {
                        foreach ($value as $v) {
                            $where[] = [$field, 'find in set', $v];
                        }
                    }

                    //IN查询
                } else if (in_array($op, ['IN', 'NOT IN',])) {
                    $value = $this->valueToArray($value);

                    if ($value) {
                        $where[] = [$field, $op, $value];
                    }

                    //区间查询
                } else if (in_array($op, ['BETWEEN', 'NOT BETWEEN'])) {
                    $data = $this->getRangeValue($value, $op, 'BETWEEN');
                    if (!$data) {
                        continue;
                    }

                    $where[] = [$field, $data[0], $data[1]];

                    //区间查询
                } else if (in_array($op, ['RANGE', 'NOT RANGE',])) {
                    $value = !is_array($value) ? str_replace([' - ', ' ~ ', '~'], ',', $value) : $value;

                    $data = $this->getRangeValue($value, $op, 'BETWEEN');
                    if (!$data) {
                        continue;
                    }

                    $op      = str_replace('RANGE', 'BETWEEN', $data[0]) . ' TIME';
                    $where[] = [$field, $op, $data[1]];

                    //NULL查询
                } else if (in_array($op, ['NULL', 'IS NULL', 'NOT NULL', 'IS NOT NULL',])) {
                    $op      = str_replace('IS ', '', $op);
                    $where[] = [$field, $op];
                }
            }
        }

        $query = function ($query) use ($where) {
            /**
             * @var $query Query
             */
            $map  = [];
            $name = $query->getName();

            foreach ($where as $key => $item) {
                $field = $item[0];

                if (!strpos($field, '.')) {
                    $item[0] = "${name}.${field}";
                }

                $map[$key] = $item;
            }

            $query->where($map);
        };

        $args = [
            'query' => [$query],
        ];

        if (!empty($order)) {
            $args['order'] = $order;
        }

        return $args;
    }

    /**
     * 字符串转数组
     * @param $value
     * @return array
     */
    protected function valueToArray($value)
    {
        return array_filter(array_values(is_string($value) ? explode(',', $value) : $value));
    }

    /**
     * 获取范围的操作符和查询数据
     * @param $value
     * @param $op
     * @param $nullExpOp
     * @return array|false
     */
    protected function getRangeValue($value, $op, $nullExpOp)
    {
        $array = array_slice(explode(',', $value), 0, 2);

        if (stripos($value, ',') === false || !array_filter($array, function ($v) {
                return $v != '' && $v !== false && $v !== null;
            })) {
            return false;
        }

        //当出现一边为空时改变操作符
        if ($array[0] === '') {
            $op    = $op == $nullExpOp ? '<=' : '>';
            $array = $array[1];
        } elseif ($array[1] === '') {
            $op    = $op == $nullExpOp ? '>=' : '<';
            $array = $array[0];
        }

        return [$op, $array];
    }

    /**
     * 获取JSON字段
     * @param $field
     * @param string $params 传入数据
     * @return array|mixed
     */
    protected function getJsonParams($field, $params = [])
    {
        $data = $params[$field] ?? $this->request->param($field, '');

        if (is_string($data)) {
            $data = (array)json_decode($data, true);
        }

        return $data;
    }

    /**
     * 获取数据
     * @param string $key
     * @return array
     */
    public function getData($key = null)
    {
        return $key ? ($this->data[$key] ?? null) : $this->data;
    }

    /**
     * 执行数据调用
     * @return mixed
     */
    abstract protected function query();

    /**
     * 验证器调用
     * @param array $validate
     * @return $this
     */
    protected function validate(array $validate = [])
    {
        $validate = $validate ?: $this->validate;

        foreach ($validate as $key => $value) {
            $this->callValidateMethod($key, $value);
        }

        return $this;
    }

    /**
     * 验证器中间件
     * @param $next
     * @return mixed
     */
    protected function validateMiddleware($next)
    {
        $this->validate();
        return $next();
    }

    /**
     * 通过验证器获取数据
     * @param array $validate
     * @param array $default
     * @return array|mixed
     */
    protected function getDataByValidate(array $validate = [], $default = [])
    {
        $validate = $validate ?: $this->validate;

        $data = $default;

        foreach ($validate as $key => $value) {
            $data = array_merge($data, $this->callValidateMethod($key, $value, self::VALIDATE_METHOD_DATA) ?? []);
        }

        return $data;
    }

    /**
     * 设置用户参数
     * @return mixed
     */
    protected function setUser()
    {
        if ($this->withUser) {
            $this->userID = $this->user->uid();

            $field = is_string($this->withUser) ? $this->withUser : $this->userField;

            $this->appendParams[$field] = $this->userID;
        }

        return $this->userID;
    }

    /**
     * 获取当前登录用户的角色
     * @return mixed
     */
    protected function getUserRole()
    {
        $role = $this->user->getUserInfo()->role;

        return $role;
    }

    /**
     * 设置label
     * @param string $key
     * @param string $name
     * @param string $field
     * @param $data
     * @return $this
     */
    protected function setLabel(string $key, string $name, string $field, $data)
    {
        $this->setData('label.' . $key, [
            'name'   => $name,
            'field'  => $field,
            'option' => $data,
        ]);

        return $this;
    }

    /**
     * 设置数据
     * @param $key
     * @param null $value
     */
    protected function setData($key, $value = null)
    {
        if (is_array($key)) {
            $this->data = $key;
        } else {
            if (strpos($key, '.')) {
                $keys  = explode('.', $key);
                $count = count($keys);
                switch ($count) {
                    case 1:
                        $this->data[$keys[0]] = $value;
                        break;
                    case 2:
                        $this->data[$keys[0]][$keys[1]] = $value;
                        break;
                    case 3:
                        $this->data[$keys[0]][$keys[1]][$keys[2]] = $value;
                        break;
                }
            } else {
                $this->data[$key] = $value;
            }
        }
    }

    /**
     * 获取查询的状态
     * @return mixed
     */
    public function getQueryStatus()
    {
        return $this->queryStatus;
    }

    /**
     * 获取参数
     * @param string $type 变量类型
     * @param bool $throw 取不到数据抛错
     * @return array
     */
    protected function getParams($type = 'param', $throw = true)
    {
        if ($this->field)
            if ($this->withoutField) {
                $params = $this->request->except(array_merge($this->field, $this->getParamsExcept), $type);
            } else {
                $params = $this->request->only($this->field, $type);
            }
        else
            $params = $this->request->except($this->getParamsExcept, $type);

        if ($throw && !$params) {
            throw new EmptyParamsException();

        }

        return array_merge($this->appendParams, $params);
    }

    /**
     * 获取逻辑类
     * @return null|string
     */
    protected function getLogicClass()
    {
        return null;
    }

    /**
     * 调用原生query
     * @param $query
     */
    protected function queryCallback($query)
    {
    }


    /**
     * 获取查询参数
     * @param array $queryArgs
     * @return array
     */
    protected function getQueryArgs($queryArgs = [])
    {
        $queryArgs = $queryArgs ?: $this->queryArgs;

        $args = [];

        foreach ($queryArgs as $key => $name) {
            $n = Str::snake($name);
            if (is_integer($key)) {
                $args[$n] = $this->$name;
            } else {
                $args[$n] = $this->$key;
            }
        }

        $args['query'] = [
            function ($query) {
                return $this->queryCallback($query);
            },
        ];

        $args['fetch_sql'] = $this->fetchSql;

        return $args;
    }

    /**
     * 调用验证器方法
     * @param $key
     * @param $value
     * @param string $method
     * @return mixed
     * @throw ValidateException
     */
    protected function callValidateMethod($key, $value, $method = self::VALIDATE_METHOD_CHECK)
    {
        if (is_integer($key)) {
            return Container::getInstance()->invokeMethod($value . '::' . $method);
        } else {

            return Container::getInstance()->invokeMethod($key . '::' . $method, [$value]);
        }
    }

    /**
     * 获取逻辑类
     * @return BaseLogic|mixed
     */
    protected function getLogic()
    {
        if (!$this->logic) {
            $name = $this->getLogicClass() ?: (new \ReflectionClass($this))->getShortName();

            $search = ['Index', 'Change', 'Delete', 'Edit', 'Read', 'Save', 'Update'];
            $name   = str_replace($search, '', $name) . 'Logic';

            $class = 'app\logic\\' . $name;

            $this->logic = Container::getInstance()->invokeClass($class);

            //使用全局查询范围
//            if (!$this->withoutGlobalScope) {
            //全局查询范围
            if (method_exists($this, 'globalScope')) {
                $scope = $this->globalScope();
                if ($scope) {
                    $this->logic->setScope($scope);
                }
            }
            if (isset($this->globalScope)) {
                $this->logic->setScope($this->globalScope);
            }
//            }
        }

        $this->logic::withScope(!$this->withoutGlobalScope);

        return $this->logic;
    }

    /**
     * 检查是否在排除的ID里
     * @return $this
     * @throws DataInoperableException
     */
    protected function checkExclude()
    {
        $ids = string2array($this->params['id'], 'intval');

        foreach ($ids as $id) {
            //是否为排除的ID
            if (in_array($id, $this->exclude)) {
                throw new DataInoperableException();
            }
        }

        return $this;
    }

    /**
     * 排除关联查询
     * @param array $args
     * @param string $key
     * @return mixed
     */
    protected function without(array $args, string $key = 'without')
    {
        $without = (string)$this->request->param($key, '');
        if ($without) {
            $without = explode(',', $without);
        }
        //获取差集
        if ($without && !empty($args['with'])) {
            $args['with'] = array_diff($args['with'], $without);
        }

        return $args;
    }

    /**
     * 获取指定ID数据对象
     * @return \app\model\BaseModel|array|false|mixed|\think\Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function getObj($args = [])
    {
        if (!empty($this->params['id'])) {
            $id = $this->params['id'];
            if (!isset($this->obj[$id])) {
                $args = array_merge($this->getQueryArgs(['where', 'whereOr', 'with', 'scope', 'field', 'withoutField']), $args);
                if ($args['field'])
                    $args['field'] = array_unique(array_merge($this->appendField, $args['field']));

                $this->obj[$id] = $this->getLogic()->getByID($id, $args) ?: false;

                if ($this->obj[$id] && $this->append) {
                    $this->obj[$id]->append($this->append);
                }
            }

            return $this->obj[$id];
        }

        return false;
    }

    /**
     * 获取对象集合
     * @param array $args
     * @return array|false
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function getObjs($args = [])
    {
        if (!empty($this->params['id'])) {
            $ids = array_unique(string2array($this->params['id'], 'intval'));

            if (!$ids) return false;

            $hasID = array_keys($this->obj);

            //获取差集
            $getID = array_diff($ids, $hasID);

            if ($getID) {
                $args = array_merge($this->getQueryArgs(['where', 'whereOr', 'with', 'scope', 'field', 'withoutField']), $args);

                if ($args['field'])
                    $args['field'] = array_unique(array_merge($this->appendField, $args['field']));
                $args['limit']    = 0;
                $args['where_in'] = ['id' => $getID];

                $result = $this->getLogic()->getAll($args);

                foreach ($result as $item) {
                    if ($this->append) {
                        $item->append($this->append);
                    }

                    $this->obj[$item->id] = $item;
                }
            }

            $data = [];

            foreach ($ids as $id) {
                if (isset($this->obj[$id])) {
                    $data[] = $this->obj[$id];
                }
            }

            return $data;
        }

        return false;
    }

    /**
     * 追加数据
     * @return $this
     */
    protected function appendCallback()
    {
        foreach ($this->appendCallback as $key => $method) {
            $field = Str::snake($method);
            if (!is_numeric($key)) {
                $field = $key;
            }

            $data = Container::getInstance()->invokeMethod([$this, $method]);

            if ($data)
                $this->setData($field, $data);
        }

        return $this;
    }

    /**
     * 设置label
     * @return $this
     */
    protected function labelCallback()
    {
        foreach ($this->labelCallback as $method => $item) {
            $snake = Str::snake($method);

            $array = explode('_', $snake);

            $do = $array[count($array) - 1];

            if (in_array($do, ['enum', 'switch'])) {
                preg_match('#get_(?<field>\w*?)_' . $do . '#', $snake, $match);
                $item['field'] = $item['field'] ?? $match['field'];
                $name          = $match['field'];

                switch ($do) {
                    case 'enum':
                        $data = $this->getLogic()->getModel()->getFieldEnum($name);
                        break;
                    case 'switch':
                        $data = $this->getLogic()->getModel()->getSwitchEnum();
                        break;
                }
            } else {
                $method = Str::camel($method);
                $data   = Container::getInstance()->invokeMethod([$this, $method]);
            }

            if (!empty($data)) {
                $key   = $item['key'] ?? $item['field'];
                $field = $item['field'] ?? $item['key'];
                $this->setLabel($key, $item['name'], $field, $data);
            }
        }

        return $this;
    }

    /**
     * 获取允许修改的字段
     * @return array
     */
    protected function getAllowField()
    {
        return array_unique(
            array_merge(
                $this->field,
                array_keys($this->append),
                array_keys($this->appendParams)
            )
        );
    }

    /**
     * 追加数据中间件
     * @param $next
     * @return mixed
     */
    protected function appendCallbackMiddleware($next)
    {
        $response = $next();

        $append = $this->request->param('_append', false);

        if ($append) {
            $this->appendCallback();
        }

        return $response;
    }

    /**
     * 标签数据中间件
     * @param $next
     * @return mixed
     */
    protected function labelCallbackMiddleware($next)
    {
        $response = $next();

        $append = $this->request->param('with_label', $this->request->param('_label'));

        if ($append) {
            $this->labelCallback();
        }

        return $response;
    }

    /**
     * 处理模型数量
     * @param Model $model
     * @return mixed
     */
    protected function formatModel($model)
    {
        if ($this->scene) {
            $model->scene($this->scene);
        }

        if ($this->append) {
//            dump($this->append);
            $model->append($this->append);
        }

        if ($this->visible) {
            $model->visible($this->visible);
        }

        if ($this->hidden) {
            $model->hidden($this->hidden);
        }

        return $model;
    }
}
