<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 16:10
 */

namespace app\common;


class ErrorCode
{
    const SUCCESS = [0, 'success'];

    const DEVICE_HAS_OTHER_USER_CONTROL = [10101, 'device has other user control'];
    const DEVICE_IS_START_CONTROL = [10102, 'device is start control'];
    const DEVICE_IS_PAUSE_CONTROL = [10103, 'device is pause control'];
    const DEVICE_IS_FINISH_CONTROL = [10104, 'device is finish control'];
    const DEVICE_IS_NOT_START_CONTROL = [10105, 'device is not start control'];
    const USER_HAS_OTHER_DEVICE_CONTROL = [10106, 'user has control other device'];
    const DEVICE_IS_WAIT_CONTROL = [10107, 'device is wait control'];
    const DEVICE_CONTROL_ERROR = [10108, 'device control error'];
    const USER_IS_CONTROL_DEVICE = [10109, 'user is control device'];

    const ADMIN_NOT_FOUND = [40101, 'admin user not found'];
    const ADMIN_PASSWORD_ERROR = [40102, 'admin password error'];
    const ACCOUNT_DISABLED = [40103, 'account is disabled'];

    const USER_NOT_FOUND = [40201, 'user not found'];
    const USER_PASSWORD_ERROR = [40202, 'user password error'];
    const USER_DISABLED = [40203, 'user is disabled'];
    const TOURIST_USER_LOGIN_ERROR = [40204, 'tourist user login error'];
    const WATER_FETCHER_IS_OTHER_BIND = [40205, 'water fetcher is other bind'];
    const WATER_FETCHER_IS_BIND = [40206, 'water fetcher is bind'];

    //授权错误
    const FLUSH_AUTH_FAIL = [50101, 'flush auth fail'];
    const ROLE_NOT_FOUND = [50102, 'role not found'];
    const NOT_AUTH = [50103, 'not auth'];
    const NOT_LOGIN = [50104, 'not login'];
    const ACCESS_TOKEN_EMPTY = [50105, 'access token is empty'];
    const STATUS_ERROR = [50106, 'status error'];

    const SAVE_DATA_ERROR = [50201, 'save data error'];
    const CHANGE_DATA_ERROR = [50202, 'change data error'];
    const DELETE_DATA_ERROR = [50203, 'delete data error'];
    const UPDATE_DATA_ERROR = [50204, 'update data error'];
    const VALIDATE_ERROR = [50901, 'validate error'];
    const PARAM_ERROR = [50902, 'param error'];
    const MESSAGE_ERROR = [50903, 'error'];
    const DATA_CANNOT_BE_DELETED = [50904, 'Data cannot be deleted'];
    const FILE_IS_EXISTS = [50905, 'file is exists'];
    const DATA_INOPERABLE = [80910, 'Data inoperable'];
    const EMPTY_PARAMS = [80911, 'Params is Empty'];
    const DATA_NOT_FOUND = [80912, 'Data not found'];
    const PASSWORD_ERROR = [80913, 'Password is Error'];
    const SYSTEM_CLOSED = [80914, 'System is closed'];

    //支付错误
    const PAYMENT_SIGN_ERROR = [80001, 'payment sign is error'];
    const PAYMENT_SIGN_EMPTY = [80002, 'payment sign is empty'];
    const PAYMENT_PUBLIC_KEY_EMPTY = [80003, 'payment public key is empty'];
    const PAYMENT_PRIVATE_KEY_EMPTY = [80004, 'payment private key is empty'];

    //服务器错误
    const SERVICE_ERROR = [90001, 'service error'];
    const INVALID_ARGUMENT = [90002, 'invalid argument'];
    const ROUTE_NOT_FOUND = [90003, 'route not found'];
    const CONTROLLER_NOT_FOUND = [90004, 'controller not found'];
    const METHOD_NOT_FOUND = [90005, 'method not found'];
    const NOT_REALLY_FOLDER = [90006, 'is not folder'];
    const CREATE_TOKEN_ERROR = [90007, 'create token error'];
}
