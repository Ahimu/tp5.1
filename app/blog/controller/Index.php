<?php
namespace app\blog\controller;
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

    public function about()
    {

        return $this->fetch();
    }

    public function message()
    {

        return $this->fetch();
    }

    public function details()
    {
        return $this->fetch();
    }


    public function comment()
    {
        return $this->fetch();
    }

}
