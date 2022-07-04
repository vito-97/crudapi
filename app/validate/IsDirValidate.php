<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/16
 * Time: 9:47
 */

namespace app\validate;


use app\common\Message;

class IsDirValidate extends BaseValidate
{
    protected $rule = [
        'dir' => 'require|checkIsDir',
    ];

//    protected $field = [
//        'dir' => 'valid_field.dir',
//    ];

    protected $message = [
        'dir.checkIsDir' => Message::IS_NOT_FOLDER,
    ];

    /**
     * 检测是否是一个文件夹
     * @param $value
     * @return bool|string
     */
    public function checkIsDir($value)
    {
        return is_dir($value);
    }
}