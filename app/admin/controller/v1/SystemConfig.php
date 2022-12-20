<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\SystemConfigLogic;

class SystemConfig extends BaseController
{
    protected $name = '系统配置';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    protected $methodName = [
        'config' => '更新配置',
    ];

    protected function initialize()
    {
        $this->logic = new SystemConfigLogic();
    }

    public function config()
    {
        $data = $this->request->put();

        $result = $this->logic->updateConfigs($data);

        return $this->success([], '更新配置成功');
    }
}
