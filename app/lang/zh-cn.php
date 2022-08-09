<?php
/**
 * Created by Command.
 * User: Vito
 * Date: 2022/08/09
 * Time: 14:09
 */
use app\common\ErrorCode;
use app\common\Message;

return [
	ErrorCode::SUCCESS[1] => 'ok',
	ErrorCode::DEVICE_HAS_OTHER_USER_CONTROL[1] => '当前设备已有其他用户在使用',
	ErrorCode::DEVICE_IS_START_CONTROL[1] => '当前设备已启动',
	ErrorCode::DEVICE_IS_PAUSE_CONTROL[1] => '当前设备已暂停',
	ErrorCode::DEVICE_IS_FINISH_CONTROL[1] => '当前设备已停止',
	ErrorCode::DEVICE_IS_NOT_START_CONTROL[1] => '当前设备还未启动',
	ErrorCode::USER_HAS_OTHER_DEVICE_CONTROL[1] => '您当前正在操作其他设备中',
	ErrorCode::DEVICE_IS_WAIT_CONTROL[1] => '当前机器等待启动中',
	ErrorCode::DEVICE_CONTROL_ERROR[1] => '设备控制失败',
	ErrorCode::USER_IS_CONTROL_DEVICE[1] => '您当前正在操作设备中',
	ErrorCode::ADMIN_NOT_FOUND[1] => '找不到该管理员',
	ErrorCode::ADMIN_PASSWORD_ERROR[1] => '管理员密码错误',
	ErrorCode::ACCOUNT_DISABLED[1] => '账号已被禁用',
	ErrorCode::USER_NOT_FOUND[1] => '用户账号或密码错误',
	ErrorCode::USER_PASSWORD_ERROR[1] => '用户密码错误',
	ErrorCode::USER_DISABLED[1] => '用户已被禁用',
	ErrorCode::TOURIST_USER_LOGIN_ERROR[1] => '游客登录失败',
	ErrorCode::WATER_FETCHER_IS_OTHER_BIND[1] => '账号已被其他微信号绑定',
	ErrorCode::WATER_FETCHER_IS_BIND[1] => '账号已绑定',
	ErrorCode::FLUSH_AUTH_FAIL[1] => '刷新权限失败',
	ErrorCode::ROLE_NOT_FOUND[1] => '找不到该权限',
	ErrorCode::NOT_AUTH[1] => '没有权限操作',
	ErrorCode::NOT_LOGIN[1] => '未登录',
	ErrorCode::ACCESS_TOKEN_EMPTY[1] => 'Access Token不能为空',
	ErrorCode::STATUS_ERROR[1] => '状态错误',
	ErrorCode::SAVE_DATA_ERROR[1] => '保存数据失败',
	ErrorCode::CHANGE_DATA_ERROR[1] => '更改数据失败',
	ErrorCode::DELETE_DATA_ERROR[1] => '删除数据失败',
	ErrorCode::UPDATE_DATA_ERROR[1] => '更新数据失败',
	ErrorCode::VALIDATE_ERROR[1] => '验证错误',
	ErrorCode::PARAM_ERROR[1] => '参数错误',
	ErrorCode::MESSAGE_ERROR[1] => 'Error',
	ErrorCode::DATA_CANNOT_BE_DELETED[1] => '数据不能删除',
	ErrorCode::FILE_IS_EXISTS[1] => '文件已经存在',
	ErrorCode::DATA_INOPERABLE[1] => '数据不能操作',
	ErrorCode::EMPTY_PARAMS[1] => '没有传递参数',
	ErrorCode::DATA_NOT_FOUND[1] => '找不到数据',
	ErrorCode::PASSWORD_ERROR[1] => '密码错误',
	ErrorCode::SYSTEM_CLOSED[1] => '后台系统已关闭进入，请耐心等待开启',
	ErrorCode::PAYMENT_SIGN_ERROR[1] => '生成支付签名失败',
	ErrorCode::PAYMENT_SIGN_EMPTY[1] => '未传入支付签名',
	ErrorCode::PAYMENT_PUBLIC_KEY_EMPTY[1] => '未传入支付公钥',
	ErrorCode::PAYMENT_PRIVATE_KEY_EMPTY[1] => '未传入支付私钥',
	ErrorCode::SERVICE_ERROR[1] => '服务器内部错误，请稍后重试',
	ErrorCode::INVALID_ARGUMENT[1] => '参数错误',
	ErrorCode::ROUTE_NOT_FOUND[1] => '路由未定义',
	ErrorCode::CONTROLLER_NOT_FOUND[1] => '控制器未定义',
	ErrorCode::METHOD_NOT_FOUND[1] => '方法未定义',
	ErrorCode::NOT_REALLY_FOLDER[1] => '不是一个文件夹',
	ErrorCode::CREATE_TOKEN_ERROR[1] => '生成Token失败',
	Message::IS_NOT_FOLDER => ':attribute不是一个真的文件夹',
	Message::FLUSH_AUTH_SUCCESS => '刷新权限成功',
	Message::PASSWORD_RULE_FAIL => '密码规则不正确。它必须包含数字、字母和特殊符号',
	Message::ROLE_NOT_FOUND => '找不到角色',
	Message::STATUS_ON => '启用',
	Message::STATUS_OFF => '禁用',
	Message::STATUS_FAIL => '失败',
	Message::STATUS_FAULT => '故障',
	Message::STATUS_DISABLED => '失效',
	Message::STATUS_EXPIRED => '已过期',
	Message::SWITCH_YES => '是',
	Message::SWITCH_NO => '否',
	Message::ENUM_VALUE_ONT_IN => ':attribute的值不在[%s]其中之一',
	Message::NO_FLOW => '没有流量',
	Message::DEVICE_IMEI_EMPTY => '请传入设备的IMEI',
	Message::DEVICE_IMEI_EXISTS => '设备的IMEI已存在',
	Message::DEVICE_ONLINE_ERROR => '设备上线失败',
	Message::ORDER_STATUS['wait'] => '待支付',
	Message::ORDER_STATUS['paid'] => '已支付',
	Message::ORDER_STATUS['cancel'] => '已取消',
	Message::ORDER_STATUS['timeout'] => '已超时',
	Message::ORDER_STATUS['refund'] => '已退款',
	Message::ORDER_STATUS['wait_refund'] => '待退款',
	'valid.username' => '账号',
	'valid.nickname' => '昵称',
	'valid.password' => '密码',
	'valid.role_id' => '角色',
	'valid.tel' => '手机',
	'valid.email' => '邮箱',
	'valid.mark' => '备注',
	'valid.disabled_mark' => '禁用备注',
	'valid.captcha' => '验证码',
	'valid.status' => '状态',
	'valid.title' => '标题',
	'valid.image' => '图片',
	'valid.link' => '链接',
	'valid.agent_id' => '运营商',
	'valid.phone' => '电话',
	'valid.real_name' => '真实姓名',
	'valid.sex' => '性别',
	'valid.birthday' => '生日',
	'valid.id_card' => '身份证',
	'valid.avatar' => '头像',
	'valid.is_vip' => '是否为会员',
	'valid.money' => '金额',
	'valid.type' => '类型',
	'valid.product_type' => '套餐类型',
	'valid.flow' => '流量(单位升)',
	'valid.name' => '名称',
	'valid.app_id' => 'APP ID',
	'valid.cus_id' => '商户ID',
	'valid.private_key' => '私钥',
	'valid.public_key' => '公钥',
	'valid.category' => '分类',
	'valid.url' => '链接',
	'valid.width' => '宽度',
	'valid.height' => '高度',
	'valid.size' => '文件大小',
	'valid.mime' => 'MIME类型',
	'valid.storage' => '存储引擎',
	'valid.verify_key' => '验证KEY',
	'valid.card_no' => '卡号',
	'valid.coupon_id' => '优惠券ID',
	'valid.user_id' => '用户ID',
	'valid.is_use' => '是否使用',
	'valid.cash_coupon_id' => '现金券ID',
	'valid.full_minus' => '满减金额',
	'valid.amount' => '金额',
	'valid.total' => '总量',
	'valid.is_infinite' => '无限量',
	'valid.product_id' => '套餐ID',
	'valid.get_start_time' => '开始领取时间',
	'valid.get_end_time' => '结束领取时间',
	'valid.use_start_time' => '使用开始时间',
	'valid.use_end_time' => '使用结束时间',
	'valid.get_time' => '获取时间范围',
	'valid.use_time' => '使用时间范围',
	'valid.coupon_day' => '有效时间',
	'valid.sort' => '排序',
	'valid.limit' => '限制数量',
	'valid.id' => '编号',
	'valid.field' => '字段',
	'valid.value' => '值',
	'valid.contract_number' => '合同号',
	'valid.customer_id' => '取水客户',
	'valid.flow_type' => '取水类型',
	'valid.version' => '版本号',
	'valid.is_new' => '是否最新',
	'valid.is_force' => '是否强制',
	'valid.content' => '内容',
	'valid.push_time' => '推送时间',
	'valid.imei' => 'IMEI',
	'valid.num_value' => '数值',
	'valid.device_id' => '设备ID',
	'valid.state' => '状态',
	'valid.device_no' => '设备号',
	'valid.repair_user_id' => '运维人员',
	'valid.tip1' => '提示1',
	'valid.tip2' => '提示2',
	'valid.tip3' => '提示3',
	'valid.tip4' => '提示4',
	'valid.lat' => '纬度',
	'valid.lng' => '经度',
	'valid.l_to_pulse' => '脉冲/升',
	'valid.used_global_product' => '使用全局套餐',
	'valid.address' => '地址',
	'valid.adverts_light' => '广告灯',
	'valid.flow_coupon_id' => '流量券',
	'valid.flow_coupon_amount' => '流量（升）',
	'valid.ID' => '编号',
	'valid.dir' => '文件夹',
	'valid.coupon_card_id' => '优惠券卡ID',
	'valid.price' => '价格',
	'valid.order_no' => '订单号',
	'valid.channel_type' => '支付类型',
	'valid.page' => '页码',
	'valid.allow_refund' => '是否可退',
	'valid.give_flow' => '赠送流量(单位升)',
	'valid.second' => '时间（秒）',
	'valid.time' => '日期',
	'valid.is_pay' => '是否支付',
	'valid.route' => '路由',
	'valid.module' => '模块',
	'valid.is_menu' => '是否为菜单',
	'valid.icon' => '图标',
	'valid.pid' => '上级ID',
	'valid.system_config_key' => '变量键',
	'valid.system_config_tab_id' => '系统配置菜单ID',
	'valid.opts' => '组件配置项',
	'valid.validate' => '验证',
	'valid.placeholder' => '描述',
	'valid.key' => '键',
	'valid.auth_ids' => '权限ID',
	'valid.time_type' => '时间类型',
	'valid.order_id' => '订单ID',
	'valid.pm' => '收入/支出情况',
	'valid.wechat_oauth_scope' => '微信授权场景',
	'valid.wechat_oauth_code' => '微信授权码',
];
