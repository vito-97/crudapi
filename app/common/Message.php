<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/16
 * Time: 10:08
 */

namespace app\common;


class Message
{
    const IS_NOT_FOLDER = ':attribute is not really folder';
    const FLUSH_AUTH_SUCCESS = 'flush auth success';
    const PASSWORD_RULE_FAIL = 'The password rule is incorrect. It must contain numbers, letters and special symbols';
    const ROLE_NOT_FOUND = 'The Role is not found';

    const STATUS_ON = 'status on';
    const STATUS_OFF = 'status off';
    const STATUS_FAIL = 'status fail';
    const STATUS_FAULT = 'status fault';
    const STATUS_DISABLED = 'status disabled';
    const STATUS_EXPIRED = 'status expired';

    const SWITCH_YES = 'yes';
    const SWITCH_NO = 'no';

    const ENUM_VALUE_ONT_IN = ':attribute value not in %s';

    const NO_FLOW = 'No flow';

    const DEVICE_IMEI_EMPTY = 'device imei empty';
    const DEVICE_IMEI_EXISTS = 'device imei exists';
    const DEVICE_ONLINE_ERROR = 'device online error';

    const ORDER_STATUS = [
        'wait'        => 'order pending payment',
        'paid'        => 'order paid',
        'cancel'      => 'order cancelled',
        'timeout'     => 'order has timed out',
        'refund'      => 'order refunded',
        'wait_refund' => 'order refund in progress',
    ];
}