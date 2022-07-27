<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/4/11
 * Time: 9:30
 */

namespace app\api\controller;

use app\common\EventName;
use app\model\Device;
use app\model\Order;
use app\model\User;
use app\service\DeviceControlService;
use app\service\MqttService;
use app\service\RedisStoreService;
use app\validate\CustomRuleValidate;
use think\console\Command;
use think\facade\Config;
use think\facade\Db;
use think\facade\Event;
use think\helper\Str;

class Test extends BaseController
{
    const NOT_NEED_LOGIN = ['*'];

    const OPEN_LOCK = ['8B', '01', '01', '11'];

    public function index($type = '')
    {
        $name = Str::camel($type);

        if (method_exists($this, $name)) {
            return $this->$name();
        } else {
            return '测试方法不存在';
        }
    }

    public function send()
    {
        $imei = $this->request->param('imei');
        $hex  = $this->request->param('hex');

        CustomRuleValidate::batchCheck(['imei' => $imei, 'hex' => $hex], ['imei|IMEI' => 'require', 'hex|指令' => 'require']);

        $service = new DeviceControlService($imei);

        $service->send(str_replace(' ', '', $hex));

        return $this->success();
    }

    public function json()
    {
        dump(json_encode([1 => 'a', 2 => 'b']));
        dump(json_encode(["0" => 'a', "1" => 'b']));
        dump(json_encode(['a', 'b']));

        dump(json_decode('{"0":"a"}', true));

        dump(json_encode(0));
        dump(json_decode("0", true));
    }

    public function config()
    {
        Config::set(['a' => 1, 'b' => 2], 'test');

        dump(Config::get('test'));

        return 'ok';
    }

    public function addTime()
    {
        $time = time() + 15;

        $user              = User::find(140);
        $user->expire_time = $time;
        $user->save();
        return 'ok';
    }

    public function waitRefund()
    {
        $order = Order::where(['user_id' => 2, 'status' => Order::STATUS_PAID, 'is_recharged' => Order::SWITCH_ON])->order('id', 'desc')->find();
        if (!$order) {
            return '没有订单';
        }
        $flow   = 35;
        $amount = $order->pay_price;
        $params = [
            'order'        => $order,
            'refund_mark'  => "退还剩余流量{$flow}L的余额{$amount}元",
            'refund_money' => $amount,
        ];
        //触发等待退款事件
        Event::trigger(EventName::ORDER_WAIT_REFUND, $params);

        return '已申请退款';
    }

    public function refund()
    {
        $order = Order::where(['user_id' => 2, 'status' => Order::STATUS_WAIT_REFUND])->order('id', 'desc')->find();

        if (!$order) {
            return '没有订单';
        }

        Event::trigger(EventName::ORDER_REFUND, ['order' => $order]);

        dump($order->toArray());
    }

    public function str2hex()
    {

        $a = str_pad(dechex(3), 2, '0', STR_PAD_LEFT);
        dump(hexdec('ffffffff'));
        dump($a);
    }

    public function device()
    {
        $imei = $this->request->param('imei');

        if (!$imei) {
            return error(1, '请传入IMEI号');
        }

        $device = Device::where('imei', trim($imei))->find();

        if (!$device) {
            return error(1, 'IMEI号未添加到数据库');
        }

        $controlService = new DeviceControlService();

        $controlService->setImei($imei);

        $mode = $this->request->param('mode');

        if ('flow' == $mode) {
            $n = $this->request->param('flow', rand(1, 65535), 'intval');
            $controlService->writeFlow($n);
            return success("已下发流量{$n}L");
        } elseif ('start' == $mode) {
            $controlService->start();
            return success('已启动');
        } elseif ('pause' == $mode) {
            $controlService->pause();
            return success('已暂停');
        } elseif ('finish' == $mode) {
            $controlService->finish()->sleep()->init()->sleep()->clearFlow();
            return success('已停止');
        } elseif ('init' == $mode) {
            $controlService->init()->sleep()->clearFlow();
            return success('已初始化');
        } elseif ('qrcode' == $mode) {
            $controlService->writeQrcodeUrl($device->qrcode_url);
            return success('已设置二维码');
        } elseif ('number' == $mode) {
            $controlService->writetDeviceNo($device->device_no);
            return success('已设置机器码');
        } elseif ('temperature' == $mode) {
            $n = $this->request->param('temperature', rand(1, 30), 'intval');
            $controlService->writeTemperature($n);
            return success('已设置温度' . $n);
        } elseif ('pulse' == $mode) {
            $n = $this->request->param('pulse', rand(1, 30), 'intval');
            $controlService->writePulse($n);
            return success('已设置脉冲参数' . $n);
        } elseif ('open' == $mode) {
            $controlService->open();
            return success('已强制开启');
        } elseif ('close' == $mode) {
            $controlService->close();
            return success('已强制结束');
        } elseif ('clear_finish_flow' == $mode) {
            $controlService->clearFinishFlow();
            return success('已清除结算流量');
        } else {
            return success('未知操作');
        }
    }

    public function mqttLog()
    {

    }

    public function setFlow()
    {
        $service = new DeviceControlService(new MqttService());

        $service->setImei('869298053598439');
        $mode = $this->request->param('mode');

        if ('init' == $mode || !$mode) {
            $n = rand(1, 99999);
            $service->writeFlow($n);
            return success("已下发余额{$n}L");
        } elseif ('start' == $mode) {
            $service->start();
            return success('已启动');
        } elseif ('finish' == $mode) {
            $service->finish()->sleep()->init();
            return success('已停止');
        }

        return 'ok';
    }

    public function count()
    {
        dump(strlen('01030004000285CA01030400B40000BA15') / 2);
    }

    public function mqttSend(MqttService $mqttService)
    {
//        $data = $this->getHex(self::OPEN_LOCK);
//        $data = hex2str(str_replace(' ', ' ', 'EE B1 10 00 02 68 74 74 70 3a 2f 2f 68 35 2e 61 69 6a 6b 6c 2e 63 6f 6d 2f 3f 64 65 76 69 63 65 5f 6e 6f 3d 38 36 39 32 39 38 30 35 33 35 39 38 34 33 39 FF FC FF FF'));
        $data = hex2str(str_replace(' ', '', '01030002000265cb'));
        $mqttService->publish('rep/869298053598439', $data);
//        $mqttService->publish('sed/869298053598439', $data);
        //'01050000ff008c3a' open
//        $mqttService->publish('rep/866545053540743', hex2str(str_replace(' ', '', '01 06 00 00 00 10 00 00 E6 02')));

        return 'ok';
    }

    protected function getHex($hex)
    {
        $head = str2hex('star');
        $foot = str2hex('endo');
        $bcc  = hex_xor($hex);

        $data = $head . join('', $hex) . $bcc . $foot;

        return $data;
    }

    protected function crc()
    {
        dump(crc16('01050FA20000'));
    }

    protected function sub()
    {
        $string = '01030004000285CA01030400C800007BCD';

        $i = strpos($string, '010304');

        $i = $i + strlen('010304');
        dump($i);

        dump(substr($string, $i, 8));
    }

    protected function clearDeviceControl()
    {
        Db::query('TRUNCATE water_device_control');

        $redis = RedisStoreService::driver();

        $redis->del('deviceLastControl');
        $redis->del('deviceLastControlByUser');
        $redis->del('deviceLastControlUserID');
        $redis->del('deviceLastControlUserID');
        $redis->del('deviceLastControlUserID');
        $redis->del('userStartFlow');
        $redis->del('userStopFlow');

    }

    protected function e($msg)
    {
        echo $msg . '<br>';
    }
}
