<?php
namespace app\admin\controller;
use think\Db;
use think\Controller;
use think\facade\Env;
class Brand extends Controller
{
    public function index()
    {
      $list=Db::name('brand')->select();
      $list=self::toLevel($list);
      $this->assign('list',$list);
      return $this->fetch();
    }

    public function add()
    {
        if (request()->isPost()){
            $data=input('post.');
            $res=Db::name('brand')->insert($data);
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
            $list=Db::name('brand')->select();
            $list=self::toLevel($list);
            $this->assign('list',$list);
            return $this->fetch();
        }

    }

    public function edit()
    {
      if (request()->isPost()){
        $id=input('id');
        $data=input('post.');
        $res=Db::name('brand')->where('id',$id)->update($data);
        if($res){
          $result['info'] = '修改成功!';
          $result['status'] = 200;
          $result['url'] =url('index');
          return $result;
        }else{
          $result['info'] = '修改失败!';
          $result['status'] = 400;
          return $result;
        }
      }else{
        $id=input('id');
        $list=Db::name('brand')->where('id',$id)->find();
        $this->assign('list',$list);
        $brand=Db::name('brand')->select();
        $brand=self::toLevel($brand);
        $this->assign('brand',$brand);
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
