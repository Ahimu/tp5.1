<?php
namespace app\admin\controller;
use think\Db;
use think\facade\Session;
use think\facade\Env;
class Index extends Common
{
    public function index()
    {
          return $this->fetch();
    }
    public function index2()
    {
        $updatelist=Db::name('update')->where('status','true')->order('addtime desc')->select();
        $this->assign('updatelist',$updatelist);
        return $this->fetch();
    }
}
