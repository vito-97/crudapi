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
    //CRUD所有的操作方法
    const CRUD = ['index', 'save', 'read', 'edit', 'change', 'delete', 'update'];

    //一天的时间戳
    const ONE_DAY_TIME = 86400;

    const SWITCH_OFF = 0;
    const SWITCH_ON  = 1;

    const VALID_CREATE_SCENE = 'create';
    const VALID_SAVE_SCENE   = 'save';
    const VALID_UPDATE_SCENE = 'update';
    const VALID_LIST_SCENE   = 'list';
    const VALID_DETAIL_SCENE = 'detail';

    //价格最终计算小于等于0时需要支付的金额
    const PRICE_ZERO_DEFAULT = 0.01;
    //发送客户端ID
    const MQTT_SEND_CLIENT_ID = 'send_server';
    //接收客户端ID
    const MQTT_SUBSCRIBE_CLIENT_ID = 'subscribe_server';
    const MQTT_SUBSCRIBE_TOPIC     = 'device/#';

    //记录日志
    const JOB_SYSTEM_LOG = 'system_log';

    // 最大每页显示数量
    const MAX_LIMIT = 1000;

    const MODULE = [
        'api'   => '接口',
        'admin' => '后台',
    ];

    //最大能保留账号多少个token
    const MAX_LOGIN = 2;
}
