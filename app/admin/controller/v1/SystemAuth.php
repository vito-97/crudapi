<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/15
 * Time: 17:17
 */

namespace app\admin\controller\v1;


use app\admin\controller\BaseController;
use app\common\ErrorCode;
use app\logic\SystemAuthLogic;
use app\common\Message;

class SystemAuth extends BaseController
{
    protected $name = '系统权限';

    protected $methodName = [
        'flush' => '刷新%s',
    ];

    protected $registerCurd = true;

    protected $registerCurdDir = 'system_auth';

    protected function initialize()
    {
        $this->logic = new SystemAuthLogic();
    }

    /**
     * 刷新权限
     * @return array
     */
    public function flush()
    {
        $status = $this->logic->flush();

        if ($status) {
            return success(Message::FLUSH_AUTH_SUCCESS);
        } else {
            return error(ErrorCode::FLUSH_AUTH_FAIL);
        }
    }
}
