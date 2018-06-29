<?php
namespace app\admin\controller;
use think\Db;
use think\facade\Session;
use think\facade\Env;
class Message extends Common
{
    public function index()
    {

        return $this->fetch();
    }

    public function detail()
    {

        return $this->fetch();
    }
}
