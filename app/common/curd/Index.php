<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 10:11
 */

namespace app\common\curd;

use app\common\Util;
use think\helper\Str;
use think\Paginator;

class Index extends BaseCurd
{
    /**
     * @var int 当前数据总量
     */
    protected $total = 0;

    /**
     * @var int 每页数量
     */
    protected $limit = 20;

    /**
     * @var int 当前分页
     */
    protected $page = 1;

    /**
     * @var int 最大分页数
     * 0不限制
     */
    protected $maxPage = 0;

    /**
     * @var int 每页数量的最大取值
     */
    protected $maxLimit = 200;

    /**
     * @var 排序
     */
    protected $order = ['id' => 'desc'];

    /**
     * @var 分组
     */
    protected $group;

    /**
     * @var Paginator 分页
     */
    protected $paginate;

    /**
     * @var bool 是否使用分页类
     */
    protected $usePaginate = true;

    protected $queryArgs = ['field', 'where', 'whereOr', 'with', 'scope', 'page', 'limit', 'order', 'group', 'usePaginate' => 'paginate', 'withoutField'];

    protected $modeExcludeQueryArgs = [
        //下拉选择不需要关联
        self::SELECT_MODE => ['with'],
    ];

    //模式下的字段
    protected $modeField = [
        self::SELECT_MODE => [],
    ];

    /**
     * 关键词搜索对应需要搜索的字段
     * @var array
     */
    protected $keywordQueryArgs = [];

    protected $fetchSql = false;

    //追加数据
    protected $append = [];

    protected $mode = self::PAGE_MODE;

    protected $_middleware = [
        'appendCallbackMiddleware',
        'labelCallbackMiddleware',
        'formatMiddleware',
    ];

    const PAGE_MODE = 'page';
    const SELECT_MODE = 'select';

    const MODE_DESC = [
        self::PAGE_MODE   => '列表',
        self::SELECT_MODE => '下拉选择',
    ];

    /**
     * 需要查询条件的字段
     * @var array
     */
    protected $queryField = [];

    //需要格式化的类型
    protected $format = '';

    protected function _init($next)
    {
        $this->page  = $this->getPage();
        $this->limit = $this->getLimit();
        $this->mode  = $this->request->param('mode', self::PAGE_MODE, 'trim');

        if (!$this->mode || !isset($this->mode)) {
            $this->mode = self::PAGE_MODE;
        }

        return $next();
    }

    /**
     * 获取查询后的分页类
     * @return mixed
     */
    public function getPaginate()
    {
        return $this->paginate;
    }

    /**
     * 获取总数
     * @return int
     */
    public function getTotal()
    {
        return $this->total;
    }

    /**
     * 查询数据
     * @return \app\model\BaseModel|\app\model\BaseModel[]|array|mixed|\think\Collection|\think\Paginator
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function query()
    {
        $args = $this->getQueryArgs();
        $result = $this->getLogic()->getAll($args);

        if ($this->fetchSql) {
            dump($result);
            dump($args);
            halt('sql');
        }

        $this->formatModel($result);

        //使用分页类
        if ($this->usePaginate) {
            $paginate = $this->paginate = $result;

            $this->total = $result->total();

            $this->setData([
                'total'     => $paginate ? $paginate->total() : $this->total,
                'last_page' => $paginate ? $paginate->lastPage() : ceil($this->total / $this->limit),
                'page'      => $paginate ? $paginate->currentPage() : $this->page,
                'limit'     => $paginate ? $paginate->listRows() : $this->limit,
                'list'      => $paginate ? $paginate->items() : $this->data,
            ]);
        } else {

            $this->setData([
                'list' => $result,
            ]);
        }

        return $result;
    }

    /**
     * 格式化中间件
     * @param $next
     * @return mixed
     */
    protected function formatMiddleware($next)
    {
        $response = $next();

        //格式化数据
        if ($this->format) {
            $method = 'format' . Str::studly($this->format);

            if (method_exists($this, $method)) {
                $list = $this->$method($this->getData('list'));

                if (is_array($list)) {
                    $this->setData('list', $list);
                }
            }
        }

        return $response;
    }

    /**
     * 格式化成树形结构
     * @param $list
     * @return array
     */
    protected function formatTree($list)
    {
        $list = Util::tree($list);

        return $list;
    }

    /**
     * 获取每页数量
     * @return array|mixed
     */
    protected function getLimit()
    {
        return $this->getNum('limit', $this->limit, $this->maxLimit);
    }

    /**
     * 获取页码
     * @return array|mixed
     */
    protected function getPage()
    {
        return $this->getNum('page', $this->page, $this->maxPage);
    }

    /**
     * 生成查询条件
     * @return $this
     */
    protected function generateWhere()
    {
        foreach ($this->queryField as $alias => $field) {
            $value = $this->request->param($field);
            $key   = is_string($alias) ? $alias : $field;
            if (!is_null($value) && '' !== $value)
                $this->where[] = [$key, '=', $value];
        }

        return $this;
    }

    /**
     * 获取数字参数
     * @param $key
     * @param $default
     * @param $max
     * @return array|mixed
     */
    protected function getNum($key, $default, $max)
    {
        $num = $this->request->param($key, $default, 'intval');

        if ($max && $num > $max) {
            $num = $max;
        }

        if ($num <= 0) {
            $num = $default;
        }

        return $num;
    }

    /**
     * 获取查询参数
     * @param array $args
     * @return array
     */
    protected function getQueryArgs($args = [])
    {
        //生成查询条件
        $this->generateWhere();

        $args = array_merge($args, parent::getQueryArgs());

        $keyword = filter_like_char($this->request->param('kw'));

        //关键词
        if ($keyword) {
            foreach ($this->keywordQueryArgs as $field) {
                $args['with_search'][$field] = $keyword;
            }
        }

        //模式排除的查询参数
        if (!empty($this->modeExcludeQueryArgs[$this->mode])) {
            foreach ($this->modeExcludeQueryArgs[$this->mode] as $key) {
                if (isset($args[$key])) {
                    unset($args[$key]);
                }
            }
        }

        //模式追加的查询参数
        if (!empty($this->modeField[$this->mode])) {
            $args['field'] = $this->modeField[$this->mode];
        }

        $args = $this->without($args);

        $params = $this->buildParams();
        if (!empty($params['order'])) {
            $args['order'] = $params['order'];
        }
        $args['query'] = array_merge($args['query'], $params['query']);
        return $args;
    }

    /**
     * 是否为选择下拉框模式
     * @param string $mode
     * @return bool
     */
    protected function isSelectMode($mode = '')
    {
        $mode = $mode ?: $this->mode;

        return $mode === self::SELECT_MODE;
    }
}
