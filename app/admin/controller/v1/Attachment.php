<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/19
 * Time: 15:49
 */

namespace app\admin\controller\v1;


use app\admin\controller\BaseController;
use app\logic\AttachmentLogic;

class Attachment extends BaseController
{
    protected $name = '附件';

    const NOT_NEED_AUTH = ['upload'];

    protected $registerCrud = true;

    protected $registerCrudDir = true;

    protected function initialize()
    {
        $this->logic = new AttachmentLogic();
    }
}
