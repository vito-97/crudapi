<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:28
 */

namespace app\exception;


use think\Exception;
use Throwable;

class BaseException extends Exception
{
    //返回数据
    protected $result = [];

    //多语言变量
    protected $vars = [];

    public function __construct($message = "", $code = 0, Throwable $previous = null)
    {
        if ($message && is_array($message)) {
            $vars = [];
            if (key($message) === 0) {
                $tmp = $message;

                if (is_array($tmp[0])) {
                    [$code, $message] = $tmp[0];
                    if (!empty($tmp[1])) {
                        $vars = $tmp[1];
                    }
                } else {
                    [$code, $message] = $tmp;
                }
            } else {
                $result = $message;

                if (!empty($result['code'])) {
                    $code = $result['code'];
                }

                if (!empty($result['data'])) {
                    $this->result = $result['data'];
                }

                if (!empty($result['vars'])) {
                    $vars = $result['vars'];
                }

                if (!empty($result['msg']) || !empty($result['message'])) {
                    $message = $result['msg'] ?? $result['message'];
                } else {
                    $message = '';
                }
            }

            if (is_integer($message)) {
                $code    = $message;
                $message = '';
            }

            $this->vars = $vars;
        }

        if (!$message && $this->message) {
            $message = lang($this->message);
        }

        if (empty($message)) {
            $message = lang($code);
        }

        parent::__construct($message, $code, $previous);
    }

    public function getResult()
    {
        return $this->result;
    }

    public function getVars()
    {
        return $this->vars;
    }
}
