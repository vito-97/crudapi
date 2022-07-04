<?php
// 全局中间件定义文件
return [
    //允许跨域
    [\app\http\middleware\AllowCrossDomain::class, [['Access-Control-Allow-Headers' => 'Accept,Authorization,Cache-Control,Content-Type,DNT,If-Modified-Since,Keep-Alive,Origin,User-Agent,X-Mx-ReqToken,X-Requested-With,Access-Token']]],

    // 全局请求缓存
//     \think\middleware\CheckRequestCache::class,
    // 多语言加载
    \think\middleware\LoadLangPack::class,
    // Session初始化
//     \think\middleware\SessionInit::class,
];
