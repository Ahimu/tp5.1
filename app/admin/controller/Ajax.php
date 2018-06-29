<?php
namespace app\admin\controller;
use think\Db;
use think\facade\Session;
use think\facade\Cookie;
use think\facade\Config;
use think\Controller;
use think\facade\Cache;
use think\facade\Env;
//------------------------======公共方法=====-----------------------------------
class Ajax extends Controller
{

    public function clear_cache()
    {
        $clear=Cache::store('redis')->clear();
        if($clear){
            $result['msg'] = '清楚成功!';
            $result['status'] = 200;
            return $result;
        }else{
            $result['msg'] = '清楚失败!';
            $result['status'] = 200;
            return $result;
        }

    }
//-----------------------======状态改变=====-------------------------------------
    public function status()
    {
        $id=input('id');
        $table=input('table');
        $field=input('field');
        $open=Db::name($table)->where('id',$id)->value($field);
        if($open=='true'){
            Db::name($table)->where('id',$id)->update([$field=>'false']);
            $result['info'] = '开启成功!';
            $result['open'] = 'false';
            $result['status'] = 200;
            return $result;
        }else{
            Db::name($table)->where('id',$id)->update([$field=>'true']);
            $result['info'] = '关闭成功!';
            $result['open'] = 'true';
            $result['status'] = 200;
            return $result;
        }
    }
//-----------------------======软删除=====-------------------------------------
    public function sofedel()
    {
        $id=input('id');
        $table=input('table');
        $res=Db::name($table)->where('id',$id)->update(['is_del'=>'true']);
        if($res){
            $result['info'] = '删除成功!';
            $result['status'] = 200;
            return $result;
        }else{
            $result['info'] = '删除!';
            $result['status'] = 400;
            return $result;
        }
    }
//-----------------------======删除=====-------------------------------------
    public function del()
    {
        $id=input('id');
        $table=input('table');
        if($id){
            $res=Db::name($table)->where('id',$id)->delete();
            if($res){
            $result['info'] = '删除成功!';
            $result['status'] = 200;
            return $result;
            }
        }else{
            $result['info'] = '删除!';
            $result['status'] = 400;
            return $result;
        }
    }
//-----------------------======全删除=====-------------------------------------
    public function alldel()
    {
        $ids=input('ids/a');
        $table=input('table');
        if($ids){
        foreach ($ids as $k =>$v) {
            Db::name($table)->where('id',$v)->delete();
        }
            $result['info'] = '删除成功!';
            $result['status'] = 200;
            return $result;
        }else{
            $result['info'] = '删除!';
            $result['status'] = 400;
            return $result;
        }

    }
    public function tags()
    {
        $catData=Db::name('tags')->select();
        $data=array();
        foreach ($catData as $k=> $v) {
            $data[]=array(
                'id'=>$v['id'],
                'name'=>$v['tagstitle']
            );
        }
        return json($data);
    }

    public function fzfhtml()
    {
      return $this->fetch('system/fzfhtml');
    }

    public function errorhtml()
    {
      return $this->fetch('system/errorhtml');
    }

    public function starter()
    {
      return $this->fetch();
    }


}
