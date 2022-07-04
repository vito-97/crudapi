<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:34
 */

namespace app\factory_user\controller;

use app\common\traits\curd\Curd;
use app\model\BaseModel;
use think\App;

class BaseController extends \app\BaseController
{
    use Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);
    }
}