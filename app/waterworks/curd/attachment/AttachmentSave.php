<?php
/**
 * Created by Command.
 * User: Vito
 */

namespace app\waterworks\curd\attachment;

use app\waterworks\curd\Save;
use app\common\Enum;
use app\exception\FileIsExistsException;
use app\logic\AttachmentLogic;
use app\validate\AttachmentValidate;

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

    protected $withUser = 'user_id';

    protected function saveMiddleware($next, $params)
    {

        $logic  = new AttachmentLogic();
        $result = $logic->upload();

        if ($result) {
            unset($result[0]['savename'], $result[0]['path']);
            $params = array_merge($params, $result[0], ['user_id' => $this->userID]);
        }

        $model = $this->getLogic()->getModel();

        $detail = $model->where(['user_id' => $params['user_id'], 'sha1' => $params['sha1']])->append($this->append)->find();

        if ($detail) {
            throw new FileIsExistsException(['data' => ['detail' => $detail]]);
        }

        return $next($params);
    }
}