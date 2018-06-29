<?php
namespace think;
header('Content-Type:text/html;charset=utf-8');
define('APP_PATH', __DIR__ . '/app/');
define('ENTRANCE', 'api');
// 加载基础文件
require __DIR__ . '/thinkphp/base.php';

Container::get('app')->path(APP_PATH)->run()->send();
