<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/15
 * Time: 17:11
 */

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\admin\curd\admin\AdminChange;
use app\admin\curd\admin\AdminDelete;
use app\admin\curd\admin\AdminEdit;
use app\admin\curd\admin\AdminIndex;
use app\admin\curd\admin\AdminRead;
use app\admin\curd\admin\AdminSave;
use app\admin\curd\admin\AdminUpdate;
use app\logic\AdminLogic;
use app\logic\SystemRoleLogic;

class Admin extends BaseController
{
    protected $name = '管理员';

    const NOT_NEED_AUTH = ['info'];

    protected $methodName = [
        'info' => '个人信息',
    ];

    public $curd = [
        'index'  => AdminIndex::class,
        'save'   => AdminSave::class,
        'change' => AdminChange::class,
        'edit'   => AdminEdit::class,
        'read'   => AdminRead::class,
        'update' => AdminUpdate::class,
        'delete' => AdminDelete::class,
    ];

    protected function initialize()
    {
        $this->logic = new AdminLogic();
    }

    public function info()
    {
        $user            = $this->user->getUserInfo();
        $systemRoleLogic = new SystemRoleLogic();
        $response        = [
            'detail' => $user,
//            'menu'   => $systemRoleLogic->getMenuList(),
            'role'   => $systemRoleLogic->getAuthList(),
        ];

        return success($response);
    }
}