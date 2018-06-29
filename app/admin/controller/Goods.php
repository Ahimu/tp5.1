<?php
namespace app\admin\controller;
use think\Db;
use think\Controller;
use think\facade\Env;
use think\Paginator;
class Goods extends Controller
{
    public function index()
    {
      $list=Db::name('goods')->select();
      $this->assign('list',$list);
      return $this->fetch();
    }

    public function add()
    {
        if (request()->isPost()){
            $data=input('post.');
            if($data['addtime']){
                $data['addtime']=strtotime($data['addtime']);
            }else{
                $data['addtime']=time();
            }
            $res=Db::name('goods')->insert($data);
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
            $category=Db::name('category')->select();
            $category=self::toLevel($category);
            $this->assign('category',$category);

            $brand=Db::name('brand')->select();
            $brand=self::toLevel($brand);
            $this->assign('brand',$brand);

            $country_flag = Db::name('country_flag')->field('id,name')->where('status',1)->order('id')->select();
            $this->assign('country_flag',$country_flag);
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
