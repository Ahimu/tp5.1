<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\facade\Session;
use think\Controller;
use think\captcha\Captcha;
use app\admin\model\Admin;
class Login extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function reg()
    {
        if (request()->isPost()){
            $username=input('username');
            $vercode=Session::pull($username);
            if($vercode!=input('vercode')){
                $result['info'] = '验证码错误!';
                $result['status'] = 400;
                return $result;
            }
            $find=Db::name('admin')->where('username',$username)->find();
            if($find){
                $result['info'] = '用户邮箱已存在!';
                $result['status'] = 400;
                return $result;
            }
            $data['password']=md5(md5(input('password')));
            $data['username']=$username;
            $data['nickname']=input('nickname');
            $data['regtime']=time();
            $data['logintime']=time();
            $data['status']='true';
            $data['avatar']='http://catlkk.oss-cn-beijing.aliyuncs.com/public/logo.jpg';
            $data['loginip']=$_SERVER['REMOTE_ADDR'];
            $res=Db::name('admin')->insert($data);
            if($res){
                $admin=Db::name('admin')->where('username',$username)->find();
                Session::set('uid',$admin['id']);
                $result['info'] = '注册成功!';
                $result['status'] = 200;
                $result['url'] = url('admin/index/index');
                return $result;
            }else{
                $result['info'] = '注册失败!';
                $result['status'] = 400;
                return $result;
            }
        }else{
            return $this->fetch();
        }
    }

    public function forget()
    {
        if (request()->isPost()){
            $username=input('username');
            $vercode=Session::pull($username);
            if($vercode!=input('vercode')){
                $result['info'] = $vercode;
                $result['status'] = 400;
                return $result;
            }else{
                $result['info'] = '';
                $result['status'] = 200;
                $result['username'] = $username;

                return $result;
            }

        }else{

             return $this->fetch();
        }
    }

    public function ftwo()
    {

        if (request()->isPost()){
            $username=input('username');
            $password=input('password');
            $password=md5(md5($password));
            $find=Db::name('user')->where('username',$username)->find();
            if($find){
                if($password==$find['password']){
                    $result['info'] = '密码修改成功!';
                    $result['status'] = 200;
                    $result['url'] = url('admin/login/index');
                    return $result;
                }else{
                    Db::name('user')->where('id',$find['id'])->update(['password'=>$password]);
                    $result['info'] = '密码修改成功!';
                    $result['status'] = 200;
                    $result['url'] = url('admin/login/index');
                    return $result;
                }
            }else{
                $result['info'] = '参数有误修改失败!';
                $result['status'] = 400;
                return $result;
            }

        }else{
            $username=input('username');
            $this->assign('username',$username);
            return $this->fetch();
        }

    }



    public function check()
    {

        $code=input('code');
        $captcha = new Captcha();
        if(!$captcha->check($code)){
            $result['info'] = '验证码错误!';
            $result['status'] = 400;
            return $result;
        }
          //用户名查找
        $username=input('username');
        $res=Db::name('admin')->where("username",$username)->find();
        if(empty($res)){
            $result['info'] = '你的账户不存在!';
            $result['status'] = 400;
            return $result;
        }else{
           //密码匹对
            $data['password']=md5(md5(input('password')));
            if($res['password'] != $data['password'] ){
                $result['info'] = '密码有误!';
                $result['status'] = 400;
                return $result;
            }else{
                if($res['status']=='false'){
                    $result['info'] = '该账号已被禁用!';
                    $result['status'] = 400;
                    return $result;
                }else{
                   //登录成功
                   $admin=$res;
                   $admin['logintime']=time();
                   $admin['loginip']=$_SERVER['REMOTE_ADDR'];
                   Db::name('admin')->where('id',$res['id'])->update($admin);
                   Session::set('uid',$admin['id']);
                   $result['info'] = '登录成功!';
                   $result['status'] = 200;
                   $result['url'] = url('admin/index/index');
                   return $result;
               }
            }
        }

    }
    //
    public function emailcode()
    {
        $username=input('username');
        $name=$username;
        $subject='验证码';
        $content=emailcode($username);
        $res=send_mail($username,$name,$subject,$content);
        if($res){
            $result['info'] = '发送成功,请注意查收!';
            $result['status'] = 200;
            return $result;
        }else{
            $result['info'] = '发送失败,请查看邮箱是否正确!';
            $result['status'] = 400;
            return $result;
        }
    }


    public function logout()
    {
        session('uid',null);
        $this->redirect('admin/login/index');
    }

    public function verify(){
        $config =    [
            // 验证码字体大小
            'fontSize'    =>    25,
            // 验证码位数
            'length'      =>    4,
            // 关闭验证码杂点
            'useNoise'    =>    false,
            'bg'          =>    [255,255,255],
        ];
        $captcha = new Captcha($config);
        return $captcha->entry();
    }

}
