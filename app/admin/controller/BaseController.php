<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 14:34
 */

namespace app\admin\controller;

use app\common\traits\curd\Curd;
use app\model\BaseModel;
use app\model\Device;
use think\App;

class BaseController extends \app\BaseController
{
    use Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $user = $this->getUserinfo();
        if ($user) {
            $role = $user->role;

            //超管可以管理所有数据
            if (!$role->isSuper()) {
                $siteID = $role->site_id;
                BaseModel::setGlobalScope(['site' => $siteID]);
            }
        }
    }
}