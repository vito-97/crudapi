#!/bin/bash
ps -ef | grep think | awk '{print $2;}' | xargs kill -9

think="/www/wwwroot/api/think"

php $think queue:listen --queue device_control &
php $think queue:listen --queue device_control_later &
php $think queue:listen --queue device_control_check >> /root/control_check_log.txt &
php $think queue:listen --queue device_timeout_check >> /root/device_control_check_log.txt &
php $think queue:listen --queue device_restart >> /root/device_restart_log.txt &
php $think queue:listen --queue order_refund >> /root/order_refund_log.txt &
php $think queue:listen --queue create_service_charge >> /root/create_service_charge_log.txt &

php $think mqtt >> /root/mqtt_log.txt &
php $think device_control_timeout >> /root/control_timeout_log.txt &

echo "success"
