<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\SystemRoleLogic;

class SystemRole extends BaseController
{
    protected $name = '角色';

    protected $registerCrud = true;

    protected $registerCrudDir = true;

    const NOT_NEED_AUTH = ['menu', 'auth'];

    protected $methodName = [
        'menu' => '获取菜单',
        'role' => '获取角色',
    ];

    protected function initialize()
    {
        $this->logic = new SystemRoleLogic();
    }

    /**
     * 菜单
     * @return mixed
     */
    public function menu()
    {
        $response = $this->logic->getMenuList();

        return success($response);
    }

    /**
     * 获取角色
     * @return array
     */
    public function role()
    {
        $response = $this->logic->getAuthList();

        return success($response);
    }
}
