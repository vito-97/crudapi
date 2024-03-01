<?php
declare (strict_types = 1);

namespace app;

use app\common\Enum;
use app\common\ErrorCode;
use app\logic\BaseLogic;
use app\service\user\UserService;
use think\App;
use think\exception\ValidateException;
use think\facade\Request;
use think\Validate;

/**
 * 控制器基础类
 */
abstract class BaseController
{
    //不需要登录的方法
    const NOT_NEED_LOGIN = [];

    //不需要验证权限的方法
    const NOT_NEED_AUTH = [];

    //不需要写日志的方法
    const NOT_NEED_LOGGER = [];

    //为true表示控制器已废弃
    const DISUSE = false;

    //控制器名称
    protected $name;

    //方法对应的名称
    protected $methodName = [];

    /**
     * Request实例
     * @var \think\Request
     */
    protected $request;

    /**
     * 应用实例
     * @var \think\App
     */
    protected $app;

    /**
     * 是否批量验证
     * @var bool
     */
    protected $batchValidate = false;

    /**
     * 控制器中间件
     * @var array
     */
    protected $middleware = [];

    /**
     * 接口版本号
     * @var array|mixed|string
     */
    protected $version = 'v1';
    /**
     * @var BaseLogic
     */
    protected $logic;

    /**
     * @var UserService
     */
    protected $user;

    protected $exceptParams = ['api_version', 'lang', 'with_label'];

    /**
     * 构造方法
     * @access public
     * @param App $app 应用对象
     */
    public function __construct(App $app)
    {
        $this->app = $app;
        $this->request = $this->app->request;

        $this->version = $this->request->param('api_version');
        $this->user = $this->request->getUser();

        //在需要调用CRUD的方法才自动注册
        if (in_array($this->request->action(), Enum::CRUD) && empty($this->crud[$this->request->action()])) {
            $this->registerCrud();
        }

        // 控制器初始化
        $this->initialize();
    }

    // 初始化
    protected function initialize()
    {
    }

    /**
     * 404
     * @param $name
     * @param $arguments
     * @return array
     */
    public function __call($name, $arguments)
    {
        return error(ErrorCode::METHOD_NOT_FOUND, "Method '$name' is not defined");
    }

    /**
     * 验证数据
     * @access protected
     * @param array $data 数据
     * @param string|array $validate 验证器名或者验证规则数组
     * @param array $message 提示信息
     * @param bool $batch 是否批量验证
     * @return array|string|true
     * @throws ValidateException
     */
    protected function validate(array $data, $validate, array $message = [], bool $batch = false)
    {
        if (is_array($validate)) {
            $v = new Validate();
            $v->rule($validate);
        } else {
            if (strpos($validate, '.')) {
                // 支持场景
                [$validate, $scene] = explode('.', $validate);
            }
            $class = false !== strpos($validate, '\\') ? $validate : $this->app->parseClass('validate', $validate);
            $v = new $class();
            if (!empty($scene)) {
                $v->scene($scene);
            }
        }

        $v->message($message);

        // 是否批量验证
        if ($batch || $this->batchValidate) {
            $v->batch(true);
        }

        return $v->failException(true)->check($data);
    }

    /**
     * 获取所有参数
     * @return array|mixed
     */
    protected function getParams()
    {
        $params = $this->request->except($this->exceptParams);

        return $params;
    }

    /**
     * 获取用户ID
     * @return int|mixed
     */
    protected function uid()
    {
        $user = $this->user;
        return $user ? $user->uid() : 0;
    }

    /**
     * 数据库查询出来的最新用户信息
     * @return model\User|array
     */
    protected function getUserinfo()
    {
        $user = $this->user;
        return $user ? $user->getUserinfo() : [];
    }

    /**
     * 获取用户角色
     * @return array|mixed
     */
    protected function getUserRole()
    {
        $user = $this->getUserinfo();

        if ($user) {
            return $user->role;
        }

        return [];
    }

    /**
     * 获取需要的数量
     * @param int $limit
     * @param string $type
     * @return int|mixed
     */
    protected function getHistoryLimit($limit = 0, $type = 'day')
    {
        if (!$limit) {
            switch ($type) {
                case 'day':
                case 'week':
                    $limit = 15;
                    break;

                case 'month':
                    $limit = 12;
                    break;
                case 'year':
                    $limit = 10;
                    break;
            }
        }

        return $limit;
    }
}
