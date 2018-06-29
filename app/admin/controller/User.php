<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Session;
use think\Controller;
use think\Config;

class User extends Common
{
//---------------------------管理员管理------------------------------------------
    public function index()
    {
    //   $list=Db::name('user')->select();
      $list= Db::name('user')->alias('a')->join('role r','a.groupid = r.id')->field('a.*,r.groupname')->select();
      $count=count($list);
      $this->assign('list',$list);
      $this->assign('count',$count);
      return $this->fetch();
    }
    public function add()
    {
        if (request()->isPost()){
            $data=input('post.');
            $user=Db::name('user')->where('username',$data['username'])->find();
            if($user){
                $result['info'] = '用户名已存在!';
                $result['status'] = 400;
                return $result;
            }
            $data['password']=md5(md5($data['password']));
            $data['regtime']=time();
            $data['logtime']=time();
            $data['logip']=$_SERVER['REMOTE_ADDR'];
            $res=Db::name('user')->insert($data);
            if($res){
                $result['info'] = '添加成功!';
                $result['status'] = 200;
                return $result;
            }else{
                $result['info'] = '添加失败!';
                $result['status'] = 400;
                return $result;
            }

        }else{
            $rolelist=Db::name('role')->select();
            $this->assign('rolelist',$rolelist);
            return $this->fetch();
        }

    }

    public function edit()
    {
        if (request()->isPost()){
            $data=input('post.');
            $id=input('id');
            $user=Db::name('user')->where('id',$id)->find();
            if(empty($data['password'])){
                $data['password']=$user['password'];
            }else{
                $data['password']=md5(md5($data['password']));
            }
            $res=Db::name('user')->where('id',$id)->update($data);
            if($res){
                $result['info'] = '修改成功!';
                $result['status'] = 200;
                return $result;
            }else{
                $result['info'] = '修改失败!';
                $result['status'] = 400;
                return $result;
            }
        }else{
            $id=input('id');
            $list=Db::name('user')->where('id',$id)->find();
            $this->assign('list',$list);

            $rolelist=Db::name('role')->select();
            $this->assign('rolelist',$rolelist);
            return $this->fetch();
        }

    }
    public function info()
    {
      return $this->fetch();
    }

    public function password()
    {
      return $this->fetch();
    }

//---------------------------管理员管理------------------------------------------
    public function role()
    {
      $list=Db::name('role')->select();
      $count=count($list);
      $this->assign('list',$list);
      $this->assign('count',$count);
      return $this->fetch();
    }
    public function roleadd()
    {
        if (request()->isPost()){
            $data=input('post.');
            $res=Db::name('role')->insert($data);
            if($res){
                $result['info'] = '添加成功!';
                $result['status'] = 200;
                return $result;
            }else{
                $result['info'] = '添加失败!';
                $result['status'] = 400;
                return $result;
            }
        }else{
            $rulelist=Db::name('auth_rule')->select();
            $str='';
            foreach($rulelist as $key=>$vo){
    		$str .= '{ "id": "' . $vo['id'] . '", "pId":"' . $vo['pid'] . '", "name":"' . $vo['title'].'"},';
        	}
        	$str = "[" . substr($str, 0, -1) . "]";
            $this->assign('str',$str);
            return $this->fetch();
        }
    }

    public function roleedit()
    {
        if (request()->isPost()){
            $data=input('post.');
            $id=input('id');
            $res=Db::name('role')->where('id',$id)->update($data);
            if($res){
                $result['info'] = '修改成功!';
                $result['status'] = 200;
                return $result;
            }else{
                $result['info'] = '修改失败!';
                $result['status'] = 400;
                return $result;
            }
        }else{
            $id=input('id');
            $list=Db::name('role')->where('id',$id)->find();
            $this->assign('list',$list);

            $rulelist=Db::name('auth_rule')->select();
            $str='';
            $ruleid=explode(',',$list['ruleid']);
            foreach($rulelist as $key=>$vo){
                if(in_array($vo['id'], $ruleid)){
                    $check=', checked:true';
                }else{
                    $check='';
                }
    		$str .= '{ "id": "' . $vo['id'] . '", "pId":"' . $vo['pid'] . '", "name":"' . $vo['title'].'" '.$check.'},';
        	}
        	$str = "[" . substr($str, 0, -1) . "]";
            $this->assign('str',$str);
            return $this->fetch();
        }
    }
//---------------------------权限管理------------------------------------------
    public function rule()
    {
        $list=Db::name('auth_rule')->select();
        $count=count($list);
        $this->assign('list',$list);
        $this->assign('count',$count);
      return $this->fetch();
    }

    public function ruleadd()
    {
        if (request()->isPost()){
            $data=input('post.');

            if($data['pid'] == 0){
                $data['pidstr'] = 0;
            }else{
                $auth_one = DB::name('auth_rule')->where('id',$data['pid'])->find();
                $data['pidstr'] = $auth_one['pidstr'].','.$data['pid'];
            }
            $res=Db::name('auth_rule')->insert($data);
            if($res){
                $result['info'] = '添加成功!';
                $result['status'] = 200;
                return $result;
            }else{
                $result['info'] = '添加失败!';
                $result['status'] = 400;
                return $result;
            }
        }else{
            $list=Db::name('auth_rule')->select();
            $list=self::toLevel($list);
            $this->assign('list',$list);
            return $this->fetch();
        }
    }
    public function ruleedit()
    {
        if (request()->isPost()){
            $data=input('post.');
            $id = $data['id'];
            if($data['pid'] == 0){
                $data['pidstr'] = 0;
            }else{
                $auth_one = DB::name('auth_rule')->where('id',$data['pid'])->find();
                $data['pidstr'] = $auth_one['pidstr'].','.$data['pid'];
            }
            $res = DB::name('auth_rule')->where('id',$id)->update($data);
            if($res){
                $result['info'] = '修改成功!';
                $result['status'] = 200;
                return $result;
            }else{
                $result['info'] = '修改失败!';
                $result['status'] = 400;
                return $result;
            }
        }else{
            $id=input('id');
            $list=Db::name('auth_rule')->where('id',$id)->find();
            $this->assign('list',$list);

            $rulelist=Db::name('auth_rule')->select();
            $rulelist=self::toLevel($rulelist);
            $this->assign('rulelist',$rulelist);
            return $this->fetch();
        }
    }

    static function toLevel($cate,$html="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;",$parentid=0,$level=0){
       $arr = array();
       foreach($cate as $v){
           if($v['pid'] == $parentid){
               $v['level'] =  $level;
               $v['html'] = str_repeat($html,$v['level']);
               $arr[] = $v;
               $arr = array_merge($arr,self::toLevel($cate,$html,$v['id'],$level+1));
           }

       }
       return $arr;
    }
}
