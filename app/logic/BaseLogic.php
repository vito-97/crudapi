<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:32
 */

namespace app\logic;


use app\exception\ErrorException;
use app\model\BaseModel;
use app\service\RedisStoreService;
use app\service\user\AdminService;
use app\service\user\BaseUserService;
use app\service\user\UserService;
use think\App;
use think\Container;
use think\db\Query;
use think\db\Raw;
use think\facade\Cache;
use think\facade\Env;

/**
 * Class BaseLogic
 * @package app\logic
 * @mixin BaseModel
 */
abstract class BaseLogic
{
    protected $app;

    protected $request;

    /**
     * @var BaseModel
     */
    protected $_model;

    /**
     * @var UserService|AdminService
     */
    protected $user;

    protected $API_VERSION;

    /**
     * 缓存对应的键
     * @var string[]
     */
    protected $cacheKey = [
        'role' => 'system_role_%s',
    ];

    /**
     * 是否使用缓存
     * @var bool
     */
    protected $useCache = true;

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

    public function __construct()
    {
        $this->app         = app();
        $this->request     = $this->app->request;
        $this->useCache    = Env::get('DB_USE_CACHE');
        $this->user        = $this->request->getUser();
        $this->API_VERSION = $this->request->param('api_version');

        $this->init();
    }

    //初始化
    protected function init()
    {
    }

    //获取模型类
    abstract protected function getModelName();

    /**
     * 获取模型类
     * @param array $args
     * @param false $new
     * @return BaseModel|mixed
     */
    final public function getModel($args = [])
    {
        $this->_model = Container::getInstance()->invokeClass($this->getModelName(), $args);

        return $this->_model;
    }

    /**
     * 获取缓存
     * @param $key
     * @param null $default
     * @return mixed
     * @throws \Psr\SimpleCache\InvalidArgumentException
     */
    public function getCache($key, $default = null)
    {
        if (!$this->useCache) return $default;
        $key = $this->getCacheKey($key);
        return $this->store()->get($key, $default);
    }

    /**
     * 设置缓存
     * @param $key
     * @param $value
     * @param null $ttl
     * @return bool
     * @throws \Psr\SimpleCache\InvalidArgumentException
     */
    public function setCache($key, $value, $ttl = null)
    {
        $key = $this->getCacheKey($key);
        return $this->store()->set($key, $value, $ttl);
    }

    /**
     * 删除缓存
     * @param $key
     * @return bool
     * @throws \Psr\SimpleCache\InvalidArgumentException\
     */
    public function deleteCache($key)
    {
        $key = $this->getCacheKey($key);
        return $this->store()->delete($key);
    }

    /**
     * 不存在则写入缓存
     * @param string $name
     * @param $value
     * @param null $expire
     * @return mixed
     * @throws \Throwable
     */
    public function rememberCache(string $name, $value, $expire = null)
    {
        $name = $this->getCacheKey($name);
        return $this->store()->remember($name, $value, $this->useCache ? $expire : 1);
    }

    /**
     * 获取缓存键
     * @param $key
     * @param mixed ...$args
     * @return string
     */
    public function getCacheKey($key, ...$args)
    {
        if (is_array($key)) {
            $args = array_merge_recursive(array_slice($key, 1), $args);
            $key  = array_shift($key);
        }

        $key = $this->cacheKey[$key] ?? $key;

        $key = sprintf($key, ...$args);

        return $key;
    }

    /**
     * 获取缓存驱动
     * @return \think\cache\Driver
     */
    public function store()
    {
        return RedisStoreService::driver();
    }

    public function setUser(BaseUserService $user)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * 获取数量
     * @param array $where
     * @param int $num 时间数
     * @param string $type 时间类型
     * @return int|mixed
     */
    public function countTotal($where = [], $num = 0, $type = 'day')
    {
        return $this->total('*', $where, 'COUNT', $num, $type);
    }

    /**
     * 求和
     * @param $field
     * @param array $where
     * @param int $num 时间数
     * @param string $type 时间类型
     * @return int|mixed
     */
    public function sumTotal($field, $where = [], $num = 0, $type = 'day')
    {
        return $this->total($field, $where, 'SUM', $num, $type);
    }

    /**
     * 统计
     * @param string $field
     * @param array $where
     * @param string $op
     * @param int $num 时间数
     * @param string $type 时间类型
     * @return int|mixed
     */
    protected function total($field = '*', $where = [], $op = 'COUNT', $num = 0, $type = 'day')
    {
        $model = $this->getModel();
        $this->checkDateType($type);
        if ($where) {
            $model = $model->where($where);
        }
        $op = strtoupper($op);
        $this->checkFunOp($op);

        if ($num) {
            $endString = ' 23:59:59';
            switch ($type) {
                case 'day':
                    $endTime = strtotime(date('Y-m-d') . $endString);
                    break;
                case 'week':
                    //获取最后一天
                    $time = time();
                    //获取最后是周几
                    $w       = date('w', $time);
                    $n       = 7 - $w;
                    $endTime = strtotime(date('Y-m-d', $w ? strtotime("+$n day", $time) : $time) . $endString);
                    break;
                case 'month':
                    $endTime = strtotime(date('Y-m-t') . $endString);
                    break;
                case 'year':
                    $endTime = strtotime(date('Y-12-t') . $endString);
                    break;
            }
            $startTime = strtotime("-$num $type", $endTime);
            $model     = $model->whereTime('create_time', 'between', [$startTime, $endTime]);
        }

        $fetchSql = false;
        $result   = $model->fieldRaw($op . '(' . $field . ') AS `nums`')->fetchSql($fetchSql)->find();

        if ($fetchSql) {
            halt($result);
        }

        return (float)$result['nums'] ?: 0;
    }

    /**
     * 统计指定时间段范围的数据
     * @param array $where
     * @param array $args
     * @return array
     * @throws ErrorException
     */
    public function countByDay($where = [], array $args = [])
    {
        $default = ['num' => 7, 'now' => 0];

        $args = array_merge($default, $args, ['type' => 'day', 'op' => 'COUNT']);

        return $this->totalDate('*', $where, $args);
    }

    /**
     * 统计指定时间段范围的数据
     * @param array $where
     * @param array $args
     * @return array
     * @throws ErrorException
     */
    public function countByWeek($where = [], array $args = [])
    {
        $default = ['num' => 7, 'now' => 0];

        $args = array_merge($default, $args, ['type' => 'week', 'op' => 'COUNT']);

        return $this->totalDate('*', $where, $args);
    }

    /**
     * 统计指定月份段范围的数据
     * @param array $where
     * @param array $args
     * @return array
     */
    public function countByMonth($where = [], array $args = [])
    {
        $default = ['num' => 12, 'now' => 0];

        $args = array_merge($default, $args, ['type' => 'month', 'op' => 'COUNT']);

        return $this->totalDate('*', $where, $args);
    }

    /**
     * 统计指定年份段范围的数据
     * @param array $where
     * @param array $args
     * @return array
     */
    public function countByYear($where = [], array $args = [])
    {
        $default = ['num' => 10, 'now' => 0];

        $args = array_merge($default, $args, ['type' => 'year', 'op' => 'COUNT']);

        $result = $this->totalDate('*', $where, $args);

        $list = [];

        foreach ($result['list'] as $key => $value) {
            $list[$key . '年'] = $value;
        }

        $result['list'] = $list;

        return $result;
    }

    /**
     * 计算指定时间段范围的和
     * @param $field
     * @param array $where
     * @param array $args
     * @return array
     * @throws ErrorException
     */
    public function sumByDay($field, $where = [], array $args = [])
    {
        $default = ['num' => 7, 'now' => 0];
        $args    = array_merge($default, $args, ['type' => 'day', 'op' => 'SUM']);
        return $this->totalDate($field, $where, $args);
    }

    /**
     * 计算指定时间段范围的和
     * @param $field
     * @param array $where
     * @param array $args
     * @return array
     * @throws ErrorException
     */
    public function sumByWeek($field, $where = [], array $args = [])
    {
        $default = ['num' => 7, 'now' => 0];
        $args    = array_merge($default, $args, ['type' => 'week', 'op' => 'SUM']);
        return $this->totalDate($field, $where, $args);
    }

    /**
     * 计算指定时间段范围的和
     * @param $field
     * @param array $where
     * @param array $args
     * @return array
     * @throws ErrorException
     */
    public function sumByMonth($field, $where = [], array $args = [])
    {
        $default = ['num' => 12, 'now' => 0];
        $args    = array_merge($default, $args, ['type' => 'month', 'op' => 'SUM']);

        return $this->totalDate($field, $where, $args);
    }

    /**
     * 计算指定时间段范围的和
     * @param $field
     * @param array $where
     * @param array $args
     * @return array
     * @throws ErrorException
     */
    public function sumByYear($field, $where = [], array $args = [])
    {
        $default = ['num' => 10, 'now' => 0];
        $args    = array_merge($default, $args, ['type' => 'year', 'op' => 'SUM']);

        $result = $this->totalDate($field, $where, $args);
        $list   = [];

        foreach ($result['list'] as $key => $value) {
            $list[$key . '年'] = $value;
        }
        $result['list'] = $list;

        return $result;
    }

    /**
     * 获取查询参数
     * @return array
     */
    public function buildParams($params = [])
    {
        $params     = $params ?: $this->request->param();
        $tableField = $this->getTableFields();
        $pk         = $this->getPk();

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
            if (!preg_match('/^[\w_\-\.]+$/', $field)) {
                continue;
            }
            //获取逻辑操作符
            $op = strtoupper($ops[$field] ?? '=');
            if (!in_array($op, self::OP)) {
                $op = '=';
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
                    $item[0] = $field;
                }

                $map[$key] = $item;
            }

            $query->where($map);
        };

        $args = [
            'query' => [$query],
            'where' => $where
        ];

        if (!empty($order)) {
            $args['order'] = $order;
        }

        return $args;
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
        if (!$array[0]) {
            $op    = $op == $nullExpOp ? '<=' : '>';
            $array = $array[1];
        } elseif (!$array[1]) {
            $op    = $op == $nullExpOp ? '>=' : '<';
            $array = $array[0];
        }

        return [$op, $array];
    }

    /**
     * 统计数据
     * @param string $field 字段
     * @param array $where 条件
     * @param array $args
     * @return array
     */
    protected function totalDate($field, $where = [], array $args = [])
    {
        $default = [
            'num'   => 1,
            'op'    => 'SUM',
            'type'  => 'day',
            'now'   => 0,
            'page'  => 0,
            'group' => null
        ];

        $args = array_merge($default, $args);

        ['op' => $op, 'type' => $type, 'now' => $now, 'num' => $num, 'page' => $page, 'group' => $g] = $args;

        if (!$now) {
            $now = time();
        }

        $num  = intval($num);
        $page = intval($page);

        if ($num <= 0) {
            $num = 10;
        }

        if ($page < 0) {
            $page = 0;
        }

        if ($page) {
            $before = $num * $page;
            //获取起始时间的偏移量
            $startTime = strtotime("-{$before} {$type}");
            //当前的时间
            $endTime = time();
            //数据库保存的最小时间
            $minTime = (int)($this->getModel()->where($where)->cache(3600)->min('create_time') ?: strtotime("-{$num} {$type}"));
            //获取偏移量
            $offset = ($page - 1) * $num;
            $now    = strtotime("-$offset {$type}");
            //分页了则获取
            if ($offset) {
                //起始时间比最小时间还小
                if ($startTime < $minTime) {
                    $startTime = $minTime;
                }
                //偏移时间比起始时间还小
                if ($now < $startTime) {
                    $now = strtotime("+{$num} {$type}", $startTime);
                }
            }
            //获取总数
            $total = date_time_diff($type, $minTime, $endTime);
            //最后一页
            $lastPage = intval(ceil($total / $num));

            if ($page > $lastPage) {
                $page = $lastPage;

                return [
                    'total'     => $total,
                    'page'      => $page,
                    'last_page' => $lastPage,
                    'limit'     => $num,
                    'list'      => [],
                ];
            }
        }

        $op = strtoupper($op);
        $this->checkFunOp($op);
        $this->checkDateType($type);

        $model = $this->getModel();
        //获取日期数组
        $dateResult = $this->getDateResult($num, $type, $now);

        if ($where) {
            $model = $model->where($where);
        }

        $date      = array_keys($dateResult);
        $count     = count($date);
        $startDate = $date[0] ?? '';

        if (!$startDate) {
            return [];
        }


        //格式化时间
        $dateFormat = '%Y-%m-%d';
        if ($type === 'week') {
            $dateFormat = '%x-%v';
        } elseif ($type === 'month') {
            $dateFormat = '%Y-%m';
        } elseif ($type === 'year') {
            $dateFormat = '%Y';
        }

        $group    = ['create_date'];
        $rawField = [
            "{$op}({$field}) as nums",
            "DATE_FORMAT(FROM_UNIXTIME(create_time), \"{$dateFormat}\") AS create_date"
        ];
        if ($g) {
            $group[]    = $g;
            $rawField[] = $g;
        }

        $group    = join(',', $group);
        $rawField = join(',', $rawField);

        $model = $model->fieldRaw($rawField)->group($group);

        $startDateTime = date('Y-m-d H:i:s', strtotime(date('Y-m-d 23:59:59', strtotime("- $num $type", $now))) + 1);
        $endDateTime   = date('Y-m-d', $now);

        //设置时间
        if ($type === 'week') {
            //获取最后一天
            $time = strtotime($endDateTime);
            //获取最后是周几
            $w = date('w', $time);
            $n = 7 - $w;

            $endDateTime   = date('Y-m-d', $w ? strtotime("+$n day", $time) : $time);
            $startDateTime = date('Y-m-d 00:00:00', strtotime("-$num $type", strtotime($endDateTime)));

        } elseif ($type === 'month') {
            //月份的最后一天
            $endDateTime = date('Y-m-t', strtotime($endDateTime));
        } elseif ($type === 'year') {
            //年的最后一天
            $endDateTime = date('Y-12-t', strtotime($endDateTime));
        }
        $endDateTime .= ' 23:59:59';

        $model = $model->whereTime('create_time', 'between', [$startDateTime, $endDateTime]);

        $fetchSql = $args['fetch_sql'] ?? false;

        $result = $model->fetchSql($fetchSql)->select();

        if ($fetchSql) {
            dump('total sql');
            halt($result);
        }
        $groupData = [];
        foreach ($result as $item) {
            if (isset($dateResult[$item['create_date']])) {
                if ($g) {
                    if (!is_array($dateResult[$item['create_date']])) {
                        $dateResult[$item['create_date']] = [];
                    }
                    $dateResult[$item['create_date']][$item[$g]] = (float)$item['nums'];
                    $groupData[]                                 = $item[$g];
                } else {
                    $dateResult[$item['create_date']] = (float)$item['nums'];
                }
            }
        }

        //需要分页
        if ($page) {
            $data = [
                'total'     => $total,
                'page'      => $page,
                'last_page' => $lastPage,
                'limit'     => $num,
                'list'      => $dateResult,
            ];

            if ($g) {
                $data['group'] = $groupData;
            }

            return $data;
        } else {
            return $dateResult;
        }
    }
    /**
     * 获取指定时间的数据
     * @param int $time
     * @param string $type
     * @param int $now
     * @return array
     */
    protected function getDateResult($time = 7, $type = 'day', $now = 0)
    {
        $result = [];

        $format = 'Y-m-d';
        if ($type === 'week') {
            $format = 'Y-W';
        } elseif ($type === 'month') {
            $format = 'Y-m';
        } elseif ($type === 'year') {
            $format = 'Y';
        }

        if (!$now) {
            $now = time();
        }
        if (is_string($now)) {
            $now = strtotime($now);
        }

        for ($i = 0; $i < $time; $i++) {
            $date          = date($format, strtotime(" - $i $type", $now));
            $result[$date] = 0;
        }

        return $result;
    }

    /**
     * 检测时间类型
     * @param $type
     * @return $this
     * @throws ErrorException
     */
    protected function checkDateType($type)
    {
        $types = ['day', 'month', 'week', 'year'];
        $type  = strtolower($type);

        if (!in_array($type, $types)) {
            throw new ErrorException('type参数错误' . $type);
        }

        return $this;
    }

    /**
     * 检测传入的mysql函数是否可以使用
     * @param $op
     * @return $this
     * @throws ErrorException
     */
    protected function checkFunOp($op)
    {
        $ops = ['SUM', 'AVG', 'COUNT'];
        $op  = strtoupper($op);

        if (!in_array($op, $ops)) {
            throw new ErrorException('op参数错误');
        }

        return $this;
    }

    public function __call($name, $arguments)
    {
        return call_user_func_array([$this->getModel(), $name], $arguments);
    }

    public static function __callStatic($name, $arguments)
    {
        return call_user_func_array([(new static())->getModel(), $name], $arguments);
    }
}
