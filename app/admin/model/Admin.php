<?php
namespace app\admin\model;
use think\Model;
use think\Db;
class Admin extends Model
{
    public function login($data){
        if(!$this->check($data['vercode'])){
            return ['code' => 0, 'msg' => '验证码错误'];
        }
        $user=Db::name('admin')->where('username',$data['username'])->find();
        if($user){
            if($user['pwd'] == md5($data['password'])){
                session('username',$user['username']);
                session('aid',$user['admin_id']);
                $avatar = $user['avatar']==''?'/static/admin/images/0.jpg':$user['avatar'];
                session('avatar',$avatar);
                return ['code' => 1, 'msg' => '登录成功!']; //信息正确
            }else{
                return ['code' => 0, 'msg' => '用户名或者密码错误，重新输入!']; //密码错误
            }
        }else{
            return ['code' => 0, 'msg' => '用户不存在!']; //用户不存在
        }
    }
    public function check($code){
        return captcha_check($code);
    }

}
