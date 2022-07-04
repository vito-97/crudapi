<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/13
 * Time: 14:08
 */

namespace app\model;


class UserWallet extends BaseModel
{
    const PM_DEC = 0;//支出
    const PM_INC = 1;//收入

    protected $pmEnum = [
        self::PM_DEC => '支出',
        self::PM_INC => '收入',
    ];
}