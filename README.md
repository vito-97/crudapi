CrudApi
===============

> 运行环境要求PHP7.2+，兼容PHP8.1

**异步任务**
> php think async_task

| 名称  | 是否必须 | 示例    | 备注                                   |
|-----|------|-------|--------------------------------------|
| 状态  | 是    | start | start/stop/reload/status/connections |
| --d | 否    | 空     | 守护进程方式                               |

> 启动异步任务：php think async_task start --d<br>
>
推送异步任务
```php
send_async_task('test_do',['name' => 'vito']);
```
执行异步任务
> 注册全局的事件监听<br>
> 事件名称：async_task_[任务名称]<br>
> 如：async_task_test_do<br>
 
手动注册监听
```php
\think\facade\Event::listen('async_task_test_do', function ($params){
    //todo
});
```
或定义到全局的事件监听配置中<br>
app/event.php
```php
return [
    'bind'    =>    [],
    'listen'  =>    [
        'async_task_test_do'    =>    ['app\listener\TestDoListener'],
        // 更多事件监听
    ],
];
```

**命令行生成类**
> php think make:class

| 名称          | 是否必须 | 示例    | 备注                                      |
|-------------|------|-------|-----------------------------------------|
| 类名          | 是    | User  | 可使用逗号分割多个                               |
| --type      | 是    | model | 生成类型，controller\|logic\|model\|validate |
| --namespace | 否    |       | 命名空间，生成多个同一命名空间的类时比较方便                  |

**命令行生成CRUD类**
> php think make:crud

| 名称          | 是否必须 | 示例              | 备注                     |
|-------------|------|-----------------|------------------------|
| 控制器名        | 是    | User            | 可使用逗号分割多个              |
| --basic     | 否    | common          | 继承的基类的模块名称             |
| --only      | 否    | index,read,save | 只生成指定方法，多个用逗号隔开        |
| --except    | 否    | delete,update   | 排除生成指定方法，多个用逗号隔开       |
| --namespace | 否    | admin           | 命名空间，生成多个同一命名空间的类时比较方便 |

**生成的CRUD类中，可以对数据进行细微的控制，也可以通过中间件拦截数据**

**示例一个用户管理功能**

> 控制器<br>
> 命令生成：**php think make:class admin@v1/User --type controller**<br>

app/admin/controller/v1/User.php

```php
<?php
declare (strict_types=1);

namespace app\admin\controller\v1;

use app\admin\controller\BaseController;
use app\logic\UserLogic;

class User extends BaseController
{
    //控制器名
    protected $name = '用户';
    //注册所有rest api
    protected $registerCrud = true;
    //注册地址为当前控制器名的下划线目录
    protected $registerCrudDir = true;

    protected function initialize()
    {
        $this->logic = new UserLogic();
    }

}
```

> 模型 <br>
> 命令生成：**php think make:class User --type model**<br>

app/model/User.php

```php
<?php

namespace app\model;

class User extends BaseModel
{
    protected $hidden = ['password', 'delete_time'];
}

```

> 逻辑层<br>
> 命令生成：**php think make:class User --type logic**<br>

app/logic/UserLogic.php

```php
<?php

namespace app\logic;

use app\model\User;

class UserLogic extends BaseLogic
{
    protected function getModelName()
    {
        return User::class;
    }
    
    protected function anyMethod() {
        //todo
    }
}
```

> REST方法实现<br>
> 命令生成：**php think make:crud admin@User**

修改指定字段数据<br>
PUT /admin/v1/user/change/1<br>
app/admin/crud/user/UserChange.php

```php
<?php

namespace app\admin\crud\user;

use app\common\crud\Change;

class UserChange extends Change
{
    //允许修改的字段
    protected $field = ['status'];
}

```

删除<br>
DELETE /admin/v1/user/1<br>
app/admin/crud/user/UserDelete.php

```php
<?php

namespace app\admin\crud\user;

use app\common\crud\Delete;

class UserDelete extends Delete
{
}
```

编辑获取数据<br>
GET /admin/v1/user/edit/1<br>
app/admin/crud/user/UserEdit.php

```php
<?php

namespace app\admin\crud\user;

use app\common\crud\Edit;

class UserEdit extends Edit
{
}

```

获取列表数据<br>
GET /admin/v1/user<br>
app/admin/crud/user/UserIndex.php

```php
<?php

namespace app\admin\crud\user;

use app\common\crud\Index;

class UserIndex extends Index
{
}

```

获取数据详情<br>
GET /admin/v1/user/1<br>
app/admin/crud/user/UserRead.php

```php
<?php

namespace app\admin\crud\user;

use app\common\crud\Read;

class UserRead extends Read
{
}

```

新增数据<br>
POST /admin/v1/user<br>
app/admin/crud/user/UserSave.php

```php
<?php

namespace app\admin\crud\user;

use app\common\crud\Save;

class UserSave extends Save
{
    //验证器
    protected $validate = [];
    //允许新增的数据字段
    protected $field = [];
    
    //添加中间件
    protected function saveMiddleware($next,$params){
        //todo
        return $next($params);
    }
}

```

更新数据<br>
PUT /admin/v1/user/1<br>
app/admin/crud/user/UserUpdate.php

```php
<?php

namespace app\admin\crud\user;

use app\common\crud\Update;use think\Model;

class UserUpdate extends Update
{
    //验证器
    protected $validate = [];
    //允许新增的数据字段
    protected $field = [];
    //获取对象时追加的字段
    protected $appendField = [];
    //条件
    protected $where = [];
    
    //更新中间件
    protected function saveMiddleware($next,Model $model,array $params){
        //todo
        return $next($model,$params);
    }
}

```

**再注册资源路由即可完成接口**

```php
think\facade\Route::resource('user', 'User');
```

**每个请求类具体要如何处理可以根据设置参数进行调整**
