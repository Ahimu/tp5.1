<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Route;
Route::resource(':version/user','api/:version.User');
Route::rule(':version/news/read','api/:version.News/read');  //注册一个资源路由，对应restful各个方法,.为目录
Route::rule(':version/user/:id/fans','api/:version.User/fans'); //restful方法中除restful api外的其他方法路由
Route::rule(':version/token/wechat','api/:version.Token/wechat');
Route::rule(':version/token/mobile','api/:version.Token/mobile');

Route::rule(':version/news/read','api/:version.News/read');
Route::rule(':version/news/getDetail','api/:version.News/getDetail');//资讯详情
return [
    '__pattern__' => [
        'name' => '\w+',
    ],
    '[hello]'     => [
        ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
        ':name' => ['index/hello', ['method' => 'post']],
    ],


];
