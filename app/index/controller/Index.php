<?php
namespace app\index\controller;
use think\Db;
use think\facade\Session;
use think\facade\Cookie;
use think\facade\Config;
use think\Controller;
use think\facade\Cache;
use think\facade\Env;
class Index extends Controller
{
    public function index()
    {

        return $this->fetch();
    }



}
