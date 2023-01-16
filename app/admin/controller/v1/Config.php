<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types = 1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\SystemConfigLogic;

class Config extends BaseController
{
    protected $name = '配置';

    const NOT_NEED_AUTH = ['index'];

    const NOT_NEED_LOGGER = ['index'];

    const NOT_NEED_LOGIN = ['index'];

    protected $field = [
        'site_name',
    ];

    protected $methodName = [
        'index' => '%s信息'
    ];

    /**
     * 初始化
     */
    protected function initialize()
    {
        $this->logic = new SystemConfigLogic();
    }

    /**
     * @return array|mixed
     */
    public function index()
    {
        $config = $this->logic->config($this->field);

        return $this->success($config);
    }

}
