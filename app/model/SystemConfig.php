<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/19
 * Time: 10:57
 */

namespace app\model;


use think\db\Query;

class SystemConfig extends BaseModel
{
    const TEXT_TYPE = 'text';
    const PASSWORD_TYPE = 'password';
    const UPLOAD_TYPE = 'upload';
    const RADIO_TYPE = 'radio';
    const CHECKBOX_TYPE = 'checkbox';
    const SELECT_TYPE = 'select';
    const TEXTAREA_TYPE = 'textarea';
    const SWITCH_TYPE = 'switch';

    protected $typeEnum = [
        self::TEXT_TYPE => '文本输入框',
        self::PASSWORD_TYPE => '密码输入框',
        self::UPLOAD_TYPE => '上传',
        self::RADIO_TYPE => '单选项',
        self::CHECKBOX_TYPE => '多选项',
        self::SELECT_TYPE => '下拉框',
        self::TEXTAREA_TYPE => '多行文本',
        self::SWITCH_TYPE => '开关',
    ];

    protected function getValueAttr($value)
    {
        if ($value) {
            return json_decode($value, true);
        }

        return '';
    }

    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('name|desc', 'like', "%{$value}%");
    }
}