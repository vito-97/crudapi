<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:34
 */

namespace app\api\controller;

use think\App;
use app\common\traits\curd\Curd;
use app\common\traits\ResponseTrait;

class BaseController extends \app\BaseController
{
    use Curd;
    use ResponseTrait;
}
