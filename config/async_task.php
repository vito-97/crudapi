<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2023/4/27
 * Time: 13:54
 */
return [
    /**
     * 推荐使用tcp 支持多进程
     * redis 和 queue都是单进程
     * 使用tcp时单独运行 [php think queue:listen --queue async_task] 用于tcp不可用时补救措施
     * tcp | redis | queue
     */
    'default' => 'tcp'
];
