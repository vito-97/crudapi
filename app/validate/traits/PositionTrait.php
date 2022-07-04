<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/2
 * Time: 14:35
 */

namespace app\validate\traits;


trait PositionTrait
{
    protected $lngRegx = '/^[\-\+]?(0?\d{1,2}(\.\d{1,8})*|1[0-7]?\d{1}(\.\d{1,8})*|180(\.0{1,8})*)$/';

    protected $latRegx = '/^[\-\+]?([0-8]?\d{1}(\.\d{1,8})*|90(\.0{1,8})*)$/';

    /**
     * 检测经度
     * @param $value
     * @return bool|string
     */
    protected function checkLat($value)
    {
        return preg_match($this->latRegx, $value) ? true : ':attribute error';
    }

    /**
     * 检测纬度
     * @param $value
     * @return bool|string
     */
    protected function checkLng($value)
    {
        return preg_match($this->lngRegx, $value) ? true : ':attribute error';
    }
}