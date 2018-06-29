<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Session;
use think\Controller;
use think\Paginator;


class Email extends Common
{
    public function index()
    {

      $list=Db::name("semail")->order('sendtime desc')->paginate(10);
      $this->assign('list',$list);
      return $this->fetch();
    }

    public function send()
    {
      if (request()->isPost()){
        $data=input('post.');
        $toemail=$data['email'];
        $name='dalianmao';
        $subject=$data['subject'];
        $content=$data['content'];
        if(send_mail($toemail,$name,$subject,$content)){
            $datas['email']=$toemail;
            $datas['sname']=$name;
            $datas['title']=$subject;
            $datas['content']=$content;
            $datas['sendtime']=time();
            $res=Db::name('semail')->insert($datas);
            if($res){
                $result['info'] = '发送成功!';
                $result['status'] = 200;
                $result['url'] = url('index');
                return $result;
            }else{
                $result['info'] = '发送失败!';
                $result['status'] = 400;
                return $result;
            }
          }
      }else{
        return $this->fetch();
      }

    }

}
