<?php
// +----------------------------------------------------------------------
// | 多语言设置
// +----------------------------------------------------------------------
$langList = [
    'zh-cn' => '简体',
//    'zh-hk' => '繁體',
//    'en-us' => '英语'
];

$extendList = [];

foreach ($langList as $lang => $langName) {
    $extendList[$lang] = [
        app()->getBasePath() . "lang/{$lang}/app.php",
        app()->getBasePath() . "lang/{$lang}/validate.php",
    ];
}

return [
    // 默认语言
    'default_lang'    => env('lang.default_lang', 'zh-cn'),
    // 允许的语言列表
    'allow_lang_list' => array_keys($langList),
    // 多语言列表
    'lang_list'       => $langList,
    // 多语言自动侦测变量名
    'detect_var'      => 'lang',
    // 是否使用Cookie记录
    'use_cookie'      => false,
    // 多语言cookie变量
    'cookie_var'      => 'think_lang',
    // 多语言header变量
    'header_var'      => 'think-lang',
    // 扩展语言包
    'extend_list'     => $extendList,
    // Accept-Language转义为对应语言包名称
    'accept_language' => [
        'zh-hans-cn' => 'zh-cn',
    ],
    // 是否支持语言分组
    'allow_group'     => false,
];
