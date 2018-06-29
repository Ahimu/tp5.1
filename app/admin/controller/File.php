<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Session;
use think\Controller;
use think\Paginator;
use think\facade\Env;

class File extends Common
{
    public function index()
    {
      $path=input('path');
      if($path){
         $path= Env::get('root_path') . 'public' . DIRECTORY_SEPARATOR . 'uploads'. DIRECTORY_SEPARATOR .$path;

         $list= getFile($path);
      }else{
         $path=Env::get('root_path') . 'public' . DIRECTORY_SEPARATOR . 'uploads';
         $list=getDir($path);
      }
      $this->assign('list',$list);
      $this->assign('path',$path);
      return $this->fetch();
    }
}
