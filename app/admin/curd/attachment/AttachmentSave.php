<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\admin\curd\attachment;

use app\common\curd\Save;
use app\common\Enum;
use app\exception\FileIsExistsException;
use app\exception\ValidateException;
use app\logic\AttachmentLogic;
use app\validate\AttachmentValidate;
use think\facade\Request;

class AttachmentSave extends Save
{
    //验证器
    protected $validate = [
        AttachmentValidate::class => Enum::VALID_SAVE_SCENE,
    ];
    //追加数据
    protected $appendParams = [];
    //允许新增的数据字段
    protected $field = ['category'];

    protected $append = ['link'];

    protected function saveMiddleware($next, $params)
    {

        $logic  = new AttachmentLogic();
        $result = $logic->upload();

        if ($result) {
            unset($result[0]['savename'], $result[0]['path']);
            $params = array_merge($params, $result[0], ['admin_id' => Request::getUser()->uid()]);
        }

        $model = $this->getLogic()->getModel();

        $detail = $model->where(['admin_id' => $params['admin_id'], 'sha1' => $params['sha1']])->find();

        if ($detail) {
            $this->formatModel($detail);
            throw new FileIsExistsException(['data' => ['detail' => $detail]]);
        }

        return $next($params);
    }
}