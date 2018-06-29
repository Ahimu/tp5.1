<?php
namespace app\admin\controller;
use think\Db;
use think\facade\Session;
use think\facade\Env;
class Ad extends Common
{
    public function index()
    {

        $list= Db::name('ad')->alias('a')->join('adtype r','a.type_id = r.id')->field('a.*,r.title as typename')->select();
        $this->assign('list',$list);
          return $this->fetch();
    }


    public function add()
    {
        if (request()->isPost()){
            $data=input('post.');
            $data['addtime']=time();
            $res=Db::name('ad')->insert($data);
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
            $list=Db::name('adtype')->select();
            $this->assign('list',$list);
            return $this->fetch();
        }
    }

    public function edit()
    {
        if (request()->isPost()){
            $id=input('id');
            $data=input('post.');
            $res=Db::name('ad')->where('id',$id)->update($data);
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
            $list=Db::name('ad')->where('id',$id)->find();
            $this->assign('list',$list);
            $adlist=Db::name('adtype')->select();
            $this->assign('adlist',$adlist);
            return $this->fetch();
        }
    }


    public function type()
    {
        $list=Db::name("adtype")->select();
        $this->assign('list',$list);
        return $this->fetch();
    }

    public function typeadd()
    {
        if (request()->isPost()){
            $data=input('post.');
            $res=Db::name('adtype')->insert($data);
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
            return $this->fetch();
        }
    }

    public function typeedit()
    {
        if (request()->isPost()){
            $id=input('id');
            $data=input('post.');
            $res=Db::name('adtype')->where('id',$id)->update($data);
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
            $list=Db::name('adtype')->where('id',$id)->find();
            $this->assign('list',$list);
            return $this->fetch();
        }
    }



}
