<?php
namespace app\admin\controller;
use think\Db;
use think\facade\Session;
use think\facade\Env;
class Admin extends Common
{
    public function index()
    {
        $list= Db::name('admin')->alias('a')->join('role r','a.groupid = r.id')->field('a.*,r.groupname')->select();
        $count=count($list);
        $this->assign('list',$list);
        $this->assign('count',$count);
        return $this->fetch();
    }

    public function add()
    {
        if (request()->isPost()){
            $data=input('post.');
            $user=Db::name('admin')->where('username',$data['username'])->find();
            if($user){
                $result['info'] = '用户名已存在!';
                $result['status'] = 400;
                return $result;
            }
            $data['password']=md5(md5($data['password']));
            $data['regtime']=time();
            $data['logintime']=time();
            $data['loginip']=$_SERVER['REMOTE_ADDR'];
            $data['avatar']="http://catlkk.oss-cn-beijing.aliyuncs.com/public/logo.jpg";
            $res=Db::name('admin')->insert($data);
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
            $user=Db::name('admin')->where('id',$id)->find();
            if(empty($data['password'])){
                $data['password']=$user['password'];
            }else{
                $data['password']=md5(md5($data['password']));
            }
            $res=Db::name('admin')->where('id',$id)->update($data);
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
            $list=Db::name('admin')->where('id',$id)->find();
            $this->assign('list',$list);

            $rolelist=Db::name('role')->select();
            $this->assign('rolelist',$rolelist);
            return $this->fetch();
        }

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

                $memu=Db::name('memu')->select();
                $memu=self::toLevel($memu);
                $this->assign('memu',$memu);


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


                $memu=Db::name('memu')->select();
                $memu=self::toLevel($memu);
                $this->assign('memu',$memu);
                return $this->fetch();
            }
        }
        static function toLevel($cate,$html="|— ",$parentid=0,$level=0){
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
