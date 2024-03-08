<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/21
 * Time: 10:55
 */

namespace app\common;

/**
 * 触发的事件
 * Class EventName
 * @package app\common
 */
class EventName
{
    /**
     * 没有对应权限访问接口触发
     * 传入管理员服务类、访问的路由信息
     */
    const NOT_AUTH_VISIT = 'not_auth_visit';

    //仪表盘
    const ADMIN_DASHBOARD = 'admin_dashboard';

    //定时任务的事件名称
    const CRONTAB_TASK = 'task_%s';

    //异步任务名称
    const ASYNC_TASK = 'async_task_%s';

    /**
     * 后台用户登录
     * 传入登录的管理员信息
     */
    const ADMIN_LOGIN = 'admin_login';

    /**
     * 用户登录
     */
    const USER_LOGIN = 'user_login';

    /**
     * 后台用户登出
     * 传入登出的管理员服务类
     */
    const ADMIN_LOGOUT = 'admin_logout';

    /**
     * 用户登出
     * 传入登出的用户服务类
     */
    const USER_LOGOUT = 'user_logout';

    //MQTT订阅的信息
    const MQTT_SUBSCRIBE_MSG = 'mqtt_subscribe_msg';

    //更新用户的流量
    const GET_USER_DETAIL = 'get_user_detail';
}
