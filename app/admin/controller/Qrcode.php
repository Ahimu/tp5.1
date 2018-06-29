<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\facade\Session;
use think\Controller;
use think\facade\Env;
class Qrcode extends Common
{
    public function index()
    {

      $list=Db::name("qrcode")->select();
      $this->assign('list',$list);
      return $this->fetch();
    }


    public function add()
    {
        if (request()->isPost()){
            $data['title']=input('title');
            $data['logo']=input('picurl');
            $data['addtime']=time();
            $data['linkurl']=input('linkurl');
            $path=$this->qrcode($data['linkurl'],$data['logo']);
            $data['erweima']=$path;
            $res=Db::name('qrcode')->insert($data);
            if($res){
                return $this->success('生成成功','index');
            }else{
                return $this->error('生成失败');
            }

       }else{

        return $this->fetch();
      }
    }


    public function qrcode($url,$logo)
    {

        $qrCode = new \Endroid\QrCode\QrCode();
        $qrCode->setText($url)
            ->setSize(300)//大小
            ->setLabelFontPath(BASE_PATH.'vendor\endroid\qrcode\assets\noto_sans.otf')
            ->setErrorCorrectionLevel('high')
            ->setForegroundColor(array('r' => 0, 'g' => 0, 'b' => 0, 'a' => 0))
            ->setBackgroundColor(array('r' => 255, 'g' => 255, 'b' => 255, 'a' => 0))
            ->setLabelFontSize(16);
        if($logo){
            $qrCode->setLogoPath(Env::get('root_path').$logo);
            $qrCode->setLogoWidth(50);

        }
        header('Content-Type:'.$qrCode->getContentType());
        $qrCode->writeString();
        $filename= '/public' . DIRECTORY_SEPARATOR . 'uploads\QRcode/'.date('YmdHis',time()).'.png';
        $path=Env::get('root_path').$filename;
        $qrCode->writeFile($path);
        $image = \think\Image::open($path);
        $image->thumb(150, 150)->save($path);
        $path=str_replace('\\','/',$filename);
        return $path;
    }
}
