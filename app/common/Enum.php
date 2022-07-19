<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/31
 * Time: 11:27
 */

namespace app\common;


class Enum
{
    //CURD所有的操作方法
    const CURD = ['index', 'save', 'read', 'edit', 'change', 'delete', 'update'];

    //一天的时间戳
    const ONE_DAY_TIME = 86400;

    const SWITCH_OFF = 0;
    const SWITCH_ON = 1;

    const VALID_CREATE_SCENE = 'create';
    const VALID_SAVE_SCENE = 'save';
    const VALID_UPDATE_SCENE = 'update';
    const VALID_LIST_SCENE = 'list';
    const VALID_DETAIL_SCENE = 'detail';

    //价格最终计算小于等于0时需要支付的金额
    const PRICE_ZERO_DEFAULT = 0.01;

    //设备推送的主题
    const DEVICE_SEND_TOPIC = '%s';
    //设备接收的主题
    const DEVICE_SUBSCRIBE_TOPIC = 'sed/#';
    //发送客户端ID
    const MQTT_SEND_CLIENT_ID = 'send_server';
    //接收客户端ID
    const MQTT_SUBSCRIBE_CLIENT_ID = 'subscribe_server';

    //支付类型
    const PAY_TYPE_WX = 'wx';
    const PAY_TYPE_ALIPAY = 'alipay';
    const PAY_TYPE_QQ = 'qq';
    const PAY_TYPE_CARD = 'card';
    const PAY_TYPE_ADD = 'add';

    //控制设备队列
    const JOB_DEVICE_CONTROL = 'device_control';
    const JOB_DEVICE_CONTROL_LATER = 'device_control_later';
    const JOB_DEVICE_RESTART = 'device_restart';
    const JOB_DEVICE_CONTROL_CHECK = 'device_control_check';

    //订单退款
    const JOB_ORDER_REFUND = 'order_refund';

    //记录日志
    const JOB_SYSTEM_LOG = 'system_log';

    const DEVICE_INIT_ON_CODE = '0103000A0001';//已下发初始化状态
    const DEVICE_INIT_OFF_CODE = '0103000A0000';//未下发初始化状态
    const DEVICE_FLOW_CODE = '01030004';//流量
    const DEVICE_FLOW_START_CODE = '010304';//余额标识开始地址
    const DEVICE_ONLINE_CODE = '6F6E6C696E65';//上线
    const DEVICE_START_CODE = '0103000B0001';//启动中
    const DEVICE_PAUSE_ON_CODE = '0103000E0001';//暂停中
    const DEVICE_PAUSE_OFF_CODE = '0103000E0000';//结束暂停
    const DEVICE_STOP_CODE = '010300090001';//已结束
    const DEVICE_IS_SET_FLOW = '0103000A0001';//已下发余额

    //居科乐
    const SITE_ONE = 1;
    //市政
    const SITE_TWO = 2;

    const MODULE = [
        'api'           => '接口',
        'admin'         => '后台',
        'agent'         => '运营商',
        'coupon_user'   => '商户',
        'repair_user'   => '运营商维护员',
        'water_company' => '水务公司',
        'customer'      => '取水客户',
        'waterworks'    => '水厂',
        'water_fetcher' => '取水员',
    ];
}