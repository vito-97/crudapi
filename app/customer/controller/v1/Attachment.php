<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\customer\controller\v1;

use app\customer\controller\BaseController;
use app\logic\AttachmentLogic;
use app\model\BaseModel;

class Attachment extends BaseController
{
    protected $name = '附件';

    protected $registerCurd = true;

    protected $registerCurdDir = true;

    protected $agentScope = false;

    /**
     * 初始化
     */
    protected function initialize()
    {
        $this->logic = new AttachmentLogic();
        BaseModel::setGlobalScope(['user' => $this->uid()]);
    }

}
