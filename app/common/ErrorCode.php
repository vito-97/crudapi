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

    const ADMIN_NOT_FOUND = [40101, 'admin user not found'];
    const ADMIN_PASSWORD_ERROR = [40102, 'admin password error'];
    const ACCOUNT_DISABLED = [40103, 'account is disabled'];

    const USER_NOT_FOUND = [40201, 'user not found'];
    const USER_PASSWORD_ERROR = [40202, 'user password error'];
    const USER_DISABLED = [40203, 'user is disabled'];
    const TOURIST_USER_LOGIN_ERROR = [40204, 'tourist user login error'];

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

    //服务器错误
    const SERVICE_ERROR = [90001, 'service error'];
    const INVALID_ARGUMENT = [90002, 'invalid argument'];
    const ROUTE_NOT_FOUND = [90003, 'route not found'];
    const CONTROLLER_NOT_FOUND = [90004, 'controller not found'];
    const METHOD_NOT_FOUND = [90005, 'method not found'];
    const NOT_REALLY_FOLDER = [90006, 'is not folder'];
    const CREATE_TOKEN_ERROR = [90007, 'create token error'];
}
