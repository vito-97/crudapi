<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/14
 * Time: 10:04
 */

namespace app\admin\controller\v1;


use app\admin\controller\BaseController;
use app\logic\UserWalletLogic;

class UserWallet extends BaseController
{
    protected $name = '钱包';

    protected $registerCurd = ['index', 'read',];

    protected $registerCurdDir = 'user';

    protected function initialize()
    {
        $this->logic = new UserWalletLogic();
    }
}