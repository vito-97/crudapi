<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\logic;

use app\exception\MessageException;
use app\model\Attachment;
use app\service\UploadService;

class AttachmentLogic extends BaseLogic
{

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return Attachment::class;
    }

    public function upload($files = [])
    {
        $result = UploadService::file($files);

        if (empty($result)) {
            throw new MessageException('请上传文件');
        }

        return $result;
    }
}
