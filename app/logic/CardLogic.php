<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:33
 */

namespace app\logic;

use app\model\Card;

class CardLogic extends BaseLogic
{
    protected function getModelName()
    {
        return Card::class;
    }
}