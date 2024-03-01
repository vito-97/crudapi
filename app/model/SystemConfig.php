<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/19
 * Time: 10:57
 */

namespace app\model;


use app\common\Util;
use app\model\traits\StringToArrayTrait;
use think\db\Query;

class SystemConfig extends BaseModel
{
    use StringToArrayTrait;

    public $langStatus = false;

    protected $type = [
        'value' => 'json',
        'opts'  => 'json',
        'list'  => 'json',
    ];

    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('name|desc', 'like', "%{$value}%");
    }

    protected function setValidateAttr($value)
    {
        if (is_array($value)) {
            $value = join('|', $value);
        }

        return $value;
    }

    protected function getValueAttr($value, $data)
    {
        $value = json_decode($value, true);

        if (strpos($data['type'], 'upload') !== false) {
            if ($value) {
                $value = Util::link($value);
            }
        }

        return $value;
    }

    protected function setValueAttr($value)
    {
        if (is_string($value)) {
            $value = Util::unlink($value);
        }

        return json_encode($value, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    }

    protected function setListAttr($value, $data)
    {
        return json_encode($this->stringToArray($value));
    }

    protected function setOptsAttr($value, $data)
    {
        return json_encode($this->stringToArray($value));
    }
}
