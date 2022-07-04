<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:34
 */

namespace app\api\controller;

use app\common\traits\curd\Curd;
use think\App;

class BaseController extends \app\BaseController
{
    use Curd;
}