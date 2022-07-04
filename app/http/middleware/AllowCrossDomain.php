<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/6/28
 * Time: 17:48
 */

namespace app\http\middleware;

use Closure;
use think\Config;
use think\facade\Log;
use think\helper\Str;
use think\Request;
use think\Response;

class AllowCrossDomain
{
    protected $cookieDomain;

    protected $header = [
        'Access-Control-Allow-Credentials' => 'true',
        'Access-Control-Max-Age'           => 1800,
        'Access-Control-Allow-Methods'     => 'GET, POST, PATCH, PUT, DELETE, OPTIONS',
    ];

    public function __construct(Config $config)
    {
        $this->cookieDomain = $config->get('cookie.domain', '');
    }

    /**
     * 允许跨域请求
     * @access public
     * @param Request $request
     * @param Closure $next
     * @param array $header
     * @return Response
     */
    public function handle($request, Closure $next, ?array $header = [])
    {
        $header = !empty($header) ? array_merge($this->header, $header) : $this->header;

        if (is_dev()) {
//            $header['Access-Control-Allow-Origin']  = '*';
//            $header['Access-Control-Allow-Headers'] = '*';
        }

        if (!isset($header['Access-Control-Allow-Origin'])) {
            $origin = $request->header('origin');

            if ($origin && ('' == $this->cookieDomain || strpos($origin, $this->cookieDomain))) {
                $header['Access-Control-Allow-Origin'] = $origin;
            } else {
                $header['Access-Control-Allow-Origin'] = '*';
            }
        }

        //兼容IOS12
/*        if (!isset($header['Access-Control-Allow-Headers'])) {
            $headerKeys                             = array_map(function ($value) {
                $value = ucwords(str_replace(['-', '_'], ' ', $value));
                $value = str_replace(' ', '-', $value);

                return $value;
            }, array_keys($request->header()));
            $header['Access-Control-Allow-Headers'] = join(',', $headerKeys);

//            Log::write(join(',', $headerKeys));
        }*/

        return $next($request)->header($header);
    }
}