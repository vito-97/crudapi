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
use think\facade\Config;

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
     * @param int $roleId 角色ID
     * @param string $route 权限
     * @return bool
     * @throws DataNotFoundException
     * @throws \Throwable
     */
    public function check(int $roleId, string $route)
    {
        $role = $this->getRoleAuth($roleId);

        if (!$role) {
            throw new DataNotFoundException(ErrorCode::ROLE_NOT_FOUND);
        }

        //为超级管理员
        if ($this->isSuper($roleId)) {
            return true;
        }

        //获取所有权限
        $auth = array_column($role['auth'], 'name', 'route');

        $status = isset($auth[$route]);

        return $status;
    }

    /**
     * 判断是否为超级管理员
     * @param $roleId
     * @return bool
     * @throws \Throwable
     */
    public function isSuper($roleId)
    {
        $role = $this->getRoleAuth($roleId);

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
     * @param int $roleId
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getAuthList($roleId = 0)
    {
        $user   = $this->user->getUserInfo();
        $roleID = $roleId ?: $user->role_id;
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
     * @param $roleId
     * @param null $with
     * @return \app\model\BaseModel|array|mixed|\think\Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getRoleByID($roleId, $with = null)
    {
        $result = $this->getByID($roleId, ['with' => $with]);

        return $result;
    }

    /**
     * 获取角色权限
     * @param int $roleId
     * @return mixed
     * @throws \Throwable
     */
    protected function getRoleAuth(int $roleId)
    {
        $key = $this->getCacheKey('role_auth', $roleId);

        $role = $this->rememberCache($key, function () use ($roleId) {
            $result = $this->getRoleByID($roleId);

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
