<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\facade\Session;
use think\facade\Cookie;
use think\facade\Config;
use think\response\Redirect;
use think\Controller;
use think\facade\Env;
class Common extends Controller
{

    public function initialize()
    {
        $uid=Session::get('uid');

        if(empty($uid)) {
            $this->redirect('login/index');
        }
        $admin=Db::name('admin')->where('id',$uid)->find();
        $this->assign('admin',$admin);


        $one_tree = DB::name("memu")->where('pid',0)->where('status','true')->order('orderid asc')->select();
        foreach($one_tree as $k=>$v){
            $two_tree = DB::name("memu")->where('pid',$v['id'])->where('status','true')->order('orderid asc')->select();
            //第二级目录存入child
                foreach($two_tree as $k2=>$v2){
                    $one_tree[$k]['child'][$k2] = $two_tree[$k2];
                    $three_tree = DB::name("memu")->where('pid',$v2['id'])->where('status','true')->order('orderid asc')->select();
                    //第三级目录存入operator
                    foreach($three_tree as $k3=>$v3){
                        $one_tree[$k]['child'][$k2]['operator'][$k3] = $three_tree[$k3];
                        $four_tree = DB::name("memu")->where('pid',$v3['id'])->where('status','true')->order('orderid asc')->select();
                        foreach($four_tree as $k4=>$v4){
                            $one_tree[$k]['memu'][$k2]['operator'][$k3]['four'][$k4] = $four_tree[$k4];
                        }
                    }
                }
        }
        $this->assign('all_tree',$one_tree);

    }

    public function _empty(){

        return $this->error('空操作，返回上次访问页面中...','index/index2');
    }

}
