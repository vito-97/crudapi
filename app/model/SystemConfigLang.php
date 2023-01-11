<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types = 1);

namespace app\model;

use app\common\Util;

class SystemConfigLang extends BaseLangModel
{
    protected $pk = ['key', 'lang'];

    protected $type = [
        'value' => 'json',
    ];

    protected function getValueAttr($value, $data)
    {
        $value = json_decode($value, true);

        return $value;
    }
}
