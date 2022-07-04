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
    protected $result = [];

    public function __construct($message = "", $code = 0, Throwable $previous = null)
    {
        if ($message && is_array($message)) {

            if (key($message) === 0) {
                $tmp     = $message;
                $message = $tmp[1];
                $code    = $tmp[0];
            } else {
                $result = $message;

                if (!empty($result['code'])) {
                    $code = $result['code'];
                }

                if (!empty($result['data'])) {
                    $this->result = $result['data'];
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
        }

        if (!$message && $this->message) {
            $message = $this->message;
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
}