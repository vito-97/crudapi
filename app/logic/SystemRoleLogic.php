<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:38
 */

namespace app\logic;


use app\common\ErrorCode;
use app\common\Util;
use app\exception\DataNotFoundException;
use app\exception\MessageException;
use app\model\SystemAuth;
use app\model\SystemRole;

class SystemRoleLogic extends BaseLogic
{
    /**
     * 缓存键
     * @var string[]
     */
    protected $cacheKey = [
        'role'      => 'system_role_%s',
        'role_auth' => 'system_role_auth_%s',
    ];

    protected function getModelName()
    {
        return SystemRole::class;
    }

    /**
     * 检测是否有权限
     * @param int $role_id 角色ID
     * @param string $route 权限
     * @return bool
     * @throws DataNotFoundException
     * @throws \Throwable
     */
    public function check(int $role_id, string $route)
    {
        $role = $this->getRoleAuth($role_id);

        if (!$role) {
            throw new DataNotFoundException(ErrorCode::ROLE_NOT_FOUND);
        }

        //为超级管理员
        if ($this->isSuper($role_id)) {
            return true;
        }

        //获取所有权限
        $auth = array_column($role['auth'], 'name', 'route');

        $status = isset($auth[$route]);

        return $status;
    }

    /**
     * 判断是否为超级管理员
     * @param $role_id
     * @return bool
     * @throws \Throwable
     */
    public function isSuper($role_id)
    {
        $role = $this->getRoleAuth($role_id);

        if (!$role) return false;

        $role = $this->getModel([$role]);

        return $role->isSuper();
    }

    /**
     * 获取菜单列表
     * @param string $module
     * @return array
     * @throws MessageException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getMenuList($module = '')
    {
        if (!$module) {
            $module = $this->app->http->getName();
        }

        $user = $this->user->getUserInfo();

        $roleID = $user->role_id;

        if (!$roleID) {
            throw new MessageException('未分配角色ID');
        }

        $role = $this->getRoleByID($roleID);

        $result = $role->getMenu($module);

        $menu = Util::tree($result);

        return $menu;
    }

    /**
     * 获取权限列表
     * @param int $role_id
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getAuthList($role_id = 0)
    {
        $user   = $this->user->getUserInfo();
        $roleID = $role_id ?: $user->role_id;
        $role   = $this->getRoleByID($roleID);

        $data = $role->getAuth(app()->http->getName(), ['url']);

        $keys = array_column($data, 'route');

        $auth = array_combine($keys, $data);

        $result = [
            'name' => $role->name,
            'key'  => $role->key,
            'auth' => $auth,
        ];

        return $result;
    }

    /**
     * 通过ID获取角色
     * @param $role_id
     * @param null $with
     * @return \app\model\BaseModel|array|mixed|\think\Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getRoleByID($role_id, $with = null)
    {
        $result = $this->getByID($role_id, ['with' => $with]);

        return $result;
    }

    /**
     * 获取角色权限
     * @param int $role_id
     * @return mixed
     * @throws \Throwable
     */
    protected function getRoleAuth(int $role_id)
    {
        $key = $this->getCacheKey('role_auth', $role_id);

        $role = $this->rememberCache($key, function () use ($role_id) {
            $result = $this->getRoleByID($role_id);

            if ($result && !$result->isSuper()) {
                $result->append(['auth']);
            }

            return $result ? $result->toArray() : $result;
        }, 60);

        return $role;
    }


    /**
     * 获取角色数据
     * @return \app\model\BaseModel|\app\model\BaseModel[]|array|\think\Collection|\think\Paginator
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getRoleLabel()
    {
        $args = ['field' => ['id', 'name', 'key']];

        $result = $this->getAll($args);

        return $result;
    }
}