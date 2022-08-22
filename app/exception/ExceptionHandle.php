<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/14
 * Time: 15:29
 */

namespace app\exception;


use app\common\ErrorCode;
use think\App;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\Handle;
use think\exception\HttpException;
use think\exception\HttpResponseException;
use think\exception\RouteNotFoundException;
use think\exception\ValidateException;
use think\facade\Lang;
use think\facade\Log;
use think\facade\Request;
use think\Response;
use Throwable;

class ExceptionHandle extends Handle
{
    /**
     * 不需要记录信息（日志）的异常类列表
     * @var array
     */
    protected $ignoreReport = [
        HttpException::class,
        HttpResponseException::class,
        ModelNotFoundException::class,
        DataNotFoundException::class,
        ValidateException::class,
        BaseException::class,
    ];

    protected $log = false;

    /**
     * 记录异常信息（包括日志或者其它方式记录）
     *
     * @access public
     * @param Throwable $exception
     * @return void
     */
    public function report(Throwable $exception): void
    {
        // 使用内置的方式记录异常日志
        parent::report($exception);
    }

    /**
     * @param \think\Request $request
     * @param Throwable $e
     * @return Response
     */
    public function render($request, Throwable $e): Response
    {
        $code = $e->getCode();
        $msg  = $e->getMessage();
        $data = [];

        //获取数据
        if ($e instanceof BaseException) {
            $data = $e->getResult();
        }

        if ($this->log) {
            $info = [
                'file'    => $e->getFile(),
                'line'    => $e->getLine(),
                'message' => $this->getMessage($e),
                'code'    => $this->getCode($e),
            ];

            if (is_array($info['code'])) {
                if (!$info['message']) {
                    $info['message'] = $info['code'][1];
                }
                $info['code'] = $info['code'][0];
            }

            $log = "[{$info['code']}]{$info['message']}[{$info['file']}:{$info['line']}]";

            $this->app->log->record($log, 'error');
        }

        if (!$e instanceof BaseException || $e instanceof ErrorException) {
            if (!($e instanceof ErrorException)) {
                $code = ErrorCode::SERVICE_ERROR;
            }

            $msg .= ' in ' . $e->getFile() . ' line ' . $e->getLine();

            if ($e instanceof RouteNotFoundException) {
                $code = ErrorCode::ROUTE_NOT_FOUND;
            }
        }

        if ($request->isAjax() || $request->isOptions() || !env('app_debug') || $e instanceof BaseException) {
            $response = error($code, $msg, $data);
            return $response;
        } else {
            return parent::render($request, $e);
        }
    }
}
