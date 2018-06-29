<?php
namespace app\admin\controller;
use think\Db;
use think\Db;
use think\Controller;
use think\facade\Env;
use think\Paginator;
class Article extends Controller
{
    public function index()
    {
        $list=Db::name("article")->order('orderid desc')->where('is_del','false')->paginate(20);
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
            $res=Db::name('article')->insert($data);
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
            $list=Db::name('category')->select();
            $list=self::toLevel($list);
            $this->assign('list',$list);
            return $this->fetch();
        }

    }

    public function edit()
    {
        if (request()->isPost()){
            $data=input('post.');
            $id=input('id');
            if($data['addtime']){
                $data['addtime']=strtotime($data['addtime']);
            }else{
                $data['addtime']=time();
            }
            $res=Db::name('article')->where('id',$id)->update($data);
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
            $list=Db::name('article')->where('id',$id)->find();
            $this->assign('list',$list);
            $classlist=Db::name('category')->select();
            $classlist=self::toLevel($classlist);
            $this->assign('classlist',$classlist);
            return $this->fetch();
        }

    }


     public function show()
     {
         $id=input('id');
         $list=Db::name('article')->where('id',$id)->find();

         $this->assign('list',$list);

         $tagsid=explode(',',$list['tags']);
         foreach($tagsid as $v){
            $tags[]= Db::name('tags')->field('tagstitle')->where('id',$v)->find();
         }
         $this->assign('tags',$tags);
        return $this->fetch();
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
