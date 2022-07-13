<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/7/12
 * Time: 17:05
 */

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\AdminLogic;
use app\validate\AdminValidate;

class Profile extends BaseController
{
    protected $name = '个人信息';

    protected $methodName = [
        'update' => '更新%s',
    ];

    const NOT_NEED_AUTH = ['update'];

    protected function initialize()
    {
        $this->logic = new AdminLogic();
    }

    /**
     * 更新个人信息
     * @return array|mixed
     * @throws \app\exception\DataNotFoundException
     * @throws \app\exception\ValidateException
     */
    public function update()
    {
        $data       = $this->request->post();
        $data['id'] = $this->uid();
        AdminValidate::batchCheck($data, 'profile');

        $params = AdminValidate::getDataByRule('profile');

        foreach ($params as $key => $val) {
            if (!$val && in_array($key, ['password'])) {
                unset($params[$key]);
            }
        }

        $user = $this->getUserinfo()->scene('api');

        $user->save($params);

        $response = [
            'detail' => $user,
        ];

        return $this->success($response, '更新个人信息成功');
    }
}