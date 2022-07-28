监听设备控制队列：
设备控制
php think queue:listen --queue device_control
设备延时控制
php think queue:listen --queue device_control_later
设备操作检测
php think queue:listen --queue device_control_check
重启
php think queue:listen --queue device_restart
订单退款
php think queue:listen --queue order_refund

系统访问日志
php think queue:listen --queue system_log

监听mqtt消息
php think mqtt

监听设备控制超时
php think device_control_timeout

生成设备的服务费定时生成 每日定时一次即可
php think device --mode sc
禁用服务费超时缴费的设备
php think device --mode pay_timeout
