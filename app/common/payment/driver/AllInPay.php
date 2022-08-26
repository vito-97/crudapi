<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/15
 * Time: 14:44
 */

namespace app\common\payment\driver;


use app\common\payment\Payment;
use app\common\payment\PaymentInterface;
use app\exception\MessageException;
use think\exception\ErrorException;
use think\facade\Request;
use think\helper\Str;
use think\facade\Log;

class AllInPay extends Payment implements PaymentInterface
{

    protected $api = 'https://vsp.allinpay.com/apiweb/';

    protected $testApi = 'https://syb-test.allinpay.com/apiweb/';

    protected $isTest = false;

    //通联公钥
    protected $publicKey = 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCm9OV6zH5DYH/ZnAVYHscEELdCNfNTHGuBv1nYYEY9FrOzE0/4kLl9f7Y9dkWHlc2ocDwbrFSm0Vqz0q2rJPxXUYBCQl5yW3jzuKSXif7q1yOwkFVtJXvuhf5WRy+1X5FOFoMvS7538No0RpnLzmNi3ktmiqmhpcY/1pmt20FHQQIDAQAB';

    protected $testPublicKey = 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDYXfu4b7xgDSmEGQpQ8Sn3RzFgl5CE4gL4TbYrND4FtCYOrvbgLijkdFgIrVVWi2hUW4K0PwBsmlYhXcbR+JSmqv9zviVXZiym0lK3glJGVCN86r9EPvNTusZZPm40TOEKMVENSYaUjCxZ7JzeZDfQ4WCeQQr2xirqn6LdJjpZ5wIDAQAB';

    protected $formatArgs = [
        'cusid'  => 'mch_id',
        'trxamt' => 'amount',
        'reqsn'  => 'order_no',
        'appid'  => 'app_id',
        'returl' => 'return_url',

        'chnltrxid' => 'channel_trade_no',
        'trxid'     => 'outer_trade_no',
        'paytime'   => 'pay_time',
        'trxstatus' => 'pay_status',

        'outtrxid'  => 'order_no',
        'trxcode'   => 'pay_code',
        'body'      => 'title',
        'randomstr' => 'random',
        'errmsg'    => 'msg',
    ];

    protected $uri = [
        'pay'    => 'h5unionpay/unionorder',
        'cancel' => 'tranx/cancel',
        'refund' => 'tranx/refund',
        'query'  => 'tranx/query',
        'close'  => 'tranx/close',
    ];

    protected $payStatusType = [
        'wx'     => 'VSP501',
        'qq'     => 'VSP505',
        'alipay' => 'VSP511',
        'card'   => 'VSP551',
    ];

    protected $payStatus = [
        'pay'    => [
            'VSP501', 'VSP505', 'VSP511', 'VSP551',
        ],
        'cancel' => [
            'VSP502', 'VSP506', 'VSP512', 'VSP552',
        ],
        'refund' => [
            'VSP503', 'VSP507', 'VSP513', 'VSP553',
        ],
    ];

    protected $payTypeDesc = [
        'VSP501' => '微信支付',
        'VSP502' => '微信支付撤销',
        'VSP503' => '微信支付退款',
        'VSP505' => '手机QQ支付',
        'VSP506' => '手机QQ支付撤销',
        'VSP507' => '手机QQ支付退款',
        'VSP511' => '支付宝支付',
        'VSP512' => '支付宝支付撤销',
        'VSP513' => '支付宝支付退款',
        'VSP551' => '银联扫码支付',
        'VSP552' => '银联扫码撤销',
        'VSP553' => '银联扫码退货',
    ];

    protected $commParams = [];

    //使用的接口版本
    const VERSION = 12;

    //API请求返回的成功状态码
    const API_RESPONSE_SUCCESS = 'SUCCESS';

    //交易成功返回码
    const PAY_SUCCESS = '0000';
    //交易不存在
    const PAY_NOT_FOUND = '1001';
    //交易处理中,请查询交易,如果是实时交易(例如刷卡支付,交易撤销,退货),建议每隔一段时间(10秒)查询交易
    const PAY_WAIT = ['2000', '2008', ''];

    const PAY_STATUS = [
        self::PAY_SUCCESS => '交易成功',
    ];

    //初始化
    protected function init()
    {
        $this->commParams = [
            'version'  => self::VERSION,
            'signtype' => 'RSA',
            'charset'  => 'UTF-8',
            'cusid'    => $this->config['mch_id'] ?? $this->config['cus_id'],
            'appid'    => $this->config['app_id'],
        ];
    }

    /**
     * 获取H5支付链接
     * @param array $param
     * @return string
     * @throws \app\exception\ErrorException
     */
    public function pay($param = [])
    {
        if (isset($param['amount'])) {
            $param['amount'] = (int)($param['amount'] * 100);
        }

        if (empty($param['random'])) {
            $param['random'] = Str::random();
        }

        $param = $this->formatArgs($param);

        $api = $this->getApi();
        $uri = $this->getApiUri('pay');

        return $api . $uri . '?' . http_build_query($param);
    }

    //扫码支付
    public function scanQrPay($param = [])
    {
        return false;
    }

    //交易撤销
    public function cancel($param = [])
    {
        $param = $this->formatArgs($param);

        $result = $this->request('cancel', $param);

        if ($this->checkApiStatus($result, __FUNCTION__)) {
            return $result;
        } else {
            return false;
        }
    }

    //交易退款
    public function refund($param = [])
    {

        if (isset($param['amount'])) {
            $param['amount'] = (int)($param['amount'] * 100);
        }

        if (empty($param['random'])) {
            $param['random'] = Str::random();
        }

        if (isset($param['order_no'])) {
            $param['oldreqsn'] = $param['order_no'];

            if (empty($param['reqsn'])) {
                $param['reqsn'] = 'r' . $param['order_no'] . rand(100, 999);
            }

            unset($param['order_no']);
        }

        $param = $this->formatArgs($param, __FUNCTION__);

//        dump($param);

        $result = $this->request('refund', $param);

        if ($this->checkApiStatus($result, __FUNCTION__)) {
            return $this->formatBackArgs($result);
        } else {
            return false;
        }
    }

    //交易查询
    public function query($param = [])
    {
        $param = $this->formatArgs($param);

        $result = $this->request('query', $param);

        if ($this->checkApiStatus($result, __FUNCTION__)) {
            return $result;
        } else {
            return false;
        }
    }

    //订单关闭
    public function close($param = [])
    {
        $param = $this->formatArgs($param);

        $result = $this->request('close', $param);

        if ($this->checkApiStatus($result, __FUNCTION__)) {
            return $result;
        } else {
            return false;
        }
    }

    //异步回调
    //{"acct":"opn0buDfEKnBBp4v76J4IEa0K8mE","accttype":"99","appid":"00231935","chnlid":"205299480","chnltrxid":"4200001323202204073672239670","cmid":"495019700","cusid":"650586057220HNX","cusorderid":"20220407094954506826","fee":"0","initamt":"1","outtrxid":"20220407094954506826","paytime":"20220407120029","sign":"RAIbm3m52pWEceMrfRioGkdBXmlzduhmmZsexOFmyVDJydcFcNWhGj1Ag3HlFPqVxVDYj7ClYKIgG8j4C2ljlgfYEkACVbQPlofO0eD45vlJibS+P69hFd6HE9sHNBlkStVyVFmrWsbrkWygWgx6WgCxkQDPSGd5\/7m\/mxfRMLo=","signtype":"RSA","termauthno":"OTHERS","termrefnum":"4200001323202204073672239670","termtraceno":"0","trxamt":"1","trxcode":"VSP501","trxdate":"20220407","trxid":"220407114419741385","trxstatus":"0000"}
    public function notify($args = [])
    {
        if (!$args) {
            $args = Request::post();
        }

        $status = $this->valid($args);

        if (!$status) {
            throw new MessageException('签名校验失败');
        }

        $params = $this->formatBackArgs($args);

        $index                  = array_search($params['pay_code'], $this->payStatusType);
        $params['channel_type'] = $index !== false ? $index : '';

        return $params;
    }

    //同步回调
    public function callback($args = [])
    {
        if (!$args) {
            $args = Request::only(['appid', 'cusid', 'reqsn', 'trxid', 'trxamt', 'remark', 'randomstr', 'sign']);
        }

        $status = $this->valid($args);

        if (!$status) {
            throw new MessageException('签名校验失败');
        }

        return $this->formatBackArgs($args);
    }

    /**
     * 获取请求api url地址
     * @param $key
     * @return string
     */
    protected function getApiUrl($key)
    {
        return $this->api . $this->uri[$key];
    }

    /**
     * 签名
     * @param array $params
     * @return string
     * @throws MessageException
     */
    public function sign(array $params)
    {
        $buffer = $this->toUrlParams($params);

        $private_key = trim($this->config['private_key'] ?? '');

        if (empty($private_key)) {
            throw new MessageException('私钥不能为空');
        }

        $private_key = chunk_split($private_key, 64, "\n");

        $key = "-----BEGIN RSA PRIVATE KEY-----\n" . wordwrap($private_key) . "-----END RSA PRIVATE KEY-----";

        try {
            if (!openssl_sign($buffer, $signature, $key)) {
                throw new MessageException('签名错误');
            }
        } catch (ErrorException $e) {
            throw new MessageException('支付的私钥或密钥有误，生成验证失败');
        }


        $sign = base64_encode($signature);//加密后的内容通常含有特殊字符，需要编码转换下，在网络间通过url传输时要注意base64编码是否是url安全的

        return $sign;
    }

    /**
     * 校验签名
     * @param array $params
     * @param bool $usePublicKey 是否使用通联的密钥去校验
     * @return int
     * @throws MessageException
     */
    public function valid(array $params = [], $usePublicKey = true)
    {
        $buffer = $this->toUrlParams($params);

        $sign = trim($params['sign'] ?? '');

        if (!$sign) {
            throw new MessageException('请传入签名');
        }

        $public_key = $usePublicKey ? $this->publicKey : trim($this->config['public_key'] ?? '');

        if (empty($public_key)) {
            throw new MessageException('公钥不能为空');
        }

        $public_key = chunk_split($public_key, 64, "\n");

        $key = "-----BEGIN PUBLIC KEY-----\n$public_key-----END PUBLIC KEY-----\n";

        try {
            $result = openssl_verify($buffer, base64_decode($sign), $key);
        } catch (ErrorException $e) {
            throw new MessageException('支付的私钥或密钥有误，验证失败');
        }

        return $result == 1;
    }

    /**
     * 支付是否成功
     * @param $code
     * @return bool
     */
    public function payIsSuccess($code)
    {
        if (is_array($code)) {
            $code = $code['pay_status'];
        }
        return $code == self::PAY_SUCCESS;
    }

    /**
     * 获取订单状态
     * @param $status
     * @return false|string
     */
    public function getPayStatus($status)
    {
        if (is_array($status)) {
            $status = $status['pay_code'];
        }

        foreach ($this->payStatus as $state => $value) {
            if (in_array($status, $value)) {
//                $key = array_search($state, $this->payStatusType);
//                return $key !== false ? $this->payStatusType[$key] : '';
                return $state;
            }
        }

        return '';
    }

    protected function appendArgs($param, $method = '')
    {
        $args = array_merge($this->commParams, $param);

        switch ($method) {
            case 'refund':
                unset($args['charset']);
                break;
        }

        return $args;
    }

    /**
     * 检测API接口响应内容
     * @param $result
     * @return bool
     * @throws MessageException
     */
    protected function checkApiStatus($result, $method = null)
    {
        if (!$result || empty($result['retcode'])) {
            Log::write('通联支付接口响应错误：' . $method);
            throw new MessageException('支付接口返回错误');
        }

        if ($result['retcode'] == self::API_RESPONSE_SUCCESS) {
            return true;
        } else {
            Log::write('通联支付接口返回错误：' . $method . ' ' . ($result['retmsg'] ?? ''));
            throw new MessageException($result['retmsg'] ?? '支付接口响应错误');
        }
    }
}
