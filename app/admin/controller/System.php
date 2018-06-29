<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Session;
use think\Controller;
use think\Config;

class System extends Common
{
    public function website()
    {
      $list = DB::name('webconfig')->select();
  	  $this->assign('list',$list);
      return $this->fetch();
    }

    public function add()
    {
        $data=input('post.');
        $find=Db::name('webconfig')->where('varname',$data['varname'])->find();
        if($find){
            $result['info'] = '字段名已存在!';
            $result['status'] = 50;
            return $result;
        }
        $res=Db::name('webconfig')->insert($data);
        if($res){
            $result['info'] = '添加成功!';
            $result['status'] = 200;
            return $result;
        }else{
            $result['info'] = '添加失败!';
            $result['status'] = 400;
            return $result;
        }
    }


    public function edit()
    {
        $data=input('post.');
        foreach($data as $k=>$v){
			$sql = "UPDATE `lk_webconfig` SET `varvalue`='".$v."' WHERE (`varname`='".$k."')";
			Db::execute($sql);
		}
        $result['info'] = '修改成功!';
        $result['status'] = 200;
        return $result;
    }



}
