<?php

use app\common\EventName;

// 事件定义文件
return [
    'bind' => [
    ],

    'listen' => [
        'AppInit'                         => [],
        'HttpRun'                         => [],
        'HttpEnd'                         => [],
        'LogLevel'                        => [],
        'LogWrite'                        => [],
        //支付同步回调
        EventName::PAY_CALLBACK           => [
            \app\listener\pay\PayCallbackListener::class,
        ],
        //支付成功
        EventName::PAY_SUCCESS            => [
            \app\listener\pay\PaySuccessOrderUpdateListener::class,
            \app\listener\pay\PaySuccessProductIncBuyTotalListener::class,
            \app\listener\pay\PaySuccessUserRechargeMoneyListener::class,
            \app\listener\pay\PaySuccessControlDeviceWaitListener::class,

            \app\listener\pay\PaySuccessServiceChargeListener::class,
            \app\listener\pay\PaySuccessUpdatePayAmountListener::class
        ],
        //撤销支付
        EventName::PAY_CANCEL             => [],
        //创建订单
        EventName::CREATE_ORDER           => [
            \app\listener\order\CreateOrderListener::class,
        ],
        //待退款
        EventName::ORDER_WAIT_REFUND      => [
            \app\listener\order\OrderWaitRefundListener::class
        ],
        //处理退款
        EventName::ORDER_REFUND           => [
            \app\listener\order\OrderRefundListener::class
        ],
        //退款成功
        EventName::ORDER_REFUND_SUCCESS   => [
            \app\listener\order\OrderRefundSuccessListener::class
        ],
        //退款失败
        EventName::ORDER_REFUND_ERROR     => [
            \app\listener\order\OrderRefundErrorListener::class
        ],

        //单独控制设备操作
        EventName::DEVICE_CONTROL_START   => [
            \app\listener\device\DeviceSetFlowListener::class,
            \app\listener\device\DeviceStartControlListener::class,
        ],
        EventName::DEVICE_CONTROL_PAUSE   => [
            \app\listener\device\DevicePauseControlListener::class,
        ],
        EventName::DEVICE_CONTROL_FINISH  => [
            \app\listener\device\DeviceFinishControlListener::class,
        ],
        EventName::DEVICE_UPDATE_FLOW     => [
            \app\listener\device\DeviceUpdateFlowListener::class,
        ],
        //设备初始化
        EventName::DEVICE_WAIT            => [
//            \app\listener\device\DeviceClearStatusListener::class,
            \app\listener\device\DeviceSetFlowListener::class,
            \app\listener\device\DeviceWaitControlListener::class,
            \app\listener\device\DeviceSetUserStartFlowListener::class,//设置启动时的流量
        ],
        //启动设备
        EventName::DEVICE_START           => [
            //先推送剩余流量
            \app\listener\device\DeviceSetFlowListener::class,
            \app\listener\device\DeviceStartControlListener::class,
        ],
        //暂停设备
        EventName::DEVICE_PAUSE           => [
            \app\listener\device\DevicePauseControlListener::class,
        ],
        //结束设备
        EventName::DEVICE_FINISH          => [
            \app\listener\device\DeviceFinishControlListener::class,
//            \app\listener\device\DeviceClearStatusListener::class,
        ],
        //等待超时
        EventName::DEVICE_WAIT_TIMEOUT    => [
//            \app\listener\device\DeviceClearStatusListener::class,
            \app\listener\device\DeviceWaitTimeoutControlListener::class,
        ],
        //设备的所有操作
        EventName::DEVICE_CONTROL         => [
            \app\listener\device\DeviceControlListener::class,
        ],
        //设备保存
        EventName::DEVICE_SAVE => [
            \app\listener\device\DeviceSaveListener::class
        ],
        //设置二维码
        EventName::DEVICE_SET_QRCODE_URL  => [
            \app\listener\device\SetQrcodeUrlListener::class,
        ],
        //设置设备号
        EventName::DEVICE_SET_DEVICE_NO   => [
            \app\listener\device\SetDeviceListenerNoListener::class,
        ],
        //设置温度
        EventName::DEVICE_SET_TEMPERATURE => [
            \app\listener\device\SetTemperatureListener::class,
        ],
        //设置脉冲参数
        EventName::DEVICE_SET_PULSE       => [
            \app\listener\device\SetPulseListener::class,
        ],
        //MQTT订阅
        EventName::MQTT_SUBSCRIBE_MSG     => [
            \app\listener\device\DeviceSubscribeMessageListener::class,
        ],
        //用户详情
        EventName::GET_USER_DETAIL        => [
            \app\listener\user\GetUserFlowListener::class,
        ],
    ],

    'subscribe' => [
    ],
];
