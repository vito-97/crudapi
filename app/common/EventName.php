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
    const AGENT_DASHBOARD = 'agent_dashboard';
    const WATER_COMPANY_DASHBOARD = 'water_company_dashboard';
    const REPAIR_USER_DASHBOARD = 'repair_user_dashboard';
    const WATERWORKS_DASHBOARD = 'waterworks_dashboard';

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

    //支付成功
    const PAY_SUCCESS = 'pay_success';
    //支付回调
    const PAY_CALLBACK = 'pay_callback';
    const PAY_CANCEL = 'pay_cancel';
    const PAY_REFUND = 'pay_refund';

    const ORDER_WAIT_REFUND = 'order_wait_refund';
    const ORDER_REFUND = 'order_refund';
    const ORDER_REFUND_SUCCESS = 'order_refund_success';
    const ORDER_REFUND_ERROR = 'order_refund_error';

    //直接发送指令
    const DEVICE_CONTROL_START = 'device_control_start';
    const DEVICE_CONTROL_PAUSE = 'device_control_pause';
    const DEVICE_CONTROL_FINISH = 'device_control_finish';

    //设备操作
    const DEVICE_WAIT = 'device_wait';
    const DEVICE_START = 'device_start';
    const DEVICE_PAUSE = 'device_pause';
    const DEVICE_FINISH = 'device_finish';
    const DEVICE_WAIT_TIMEOUT = 'device_wait_timeout';
    const DEVICE_CONTROL = 'device_control';
    const DEVICE_SET_QRCODE_URL = 'device_set_qrcode_url';
    const DEVICE_SET_DEVICE_NO = 'device_set_device_no';
    const DEVICE_SET_TEMPERATURE = 'device_set_temperature';
    const DEVICE_SET_PULSE = 'device_set_pulse';
    const DEVICE_UPDATE_FLOW = 'device_update_flow';
    const DEVICE_SAVE = 'device_save';

    //MQTT订阅的信息
    const MQTT_SUBSCRIBE_MSG = 'mqtt_subscribe_msg';

    const CREATE_ORDER = 'create_order';

    //更新用户的流量
    const GET_USER_DETAIL = 'get_user_detail';
}