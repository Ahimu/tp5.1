<?php
use think\Db;
use think\facade\Session;


function GetOrderID($tbname)
{
	$r = Db::query("SELECT MAX(orderid) AS `orderid` FROM `$tbname`");
    $orderid = (empty($r['0']['orderid']) ? 1 : ($r['0']['orderid'] + 1));
	return $orderid;
}
//邮件发送
function send_mail($toemail,$name,$subject,$content)
{
      $mail = new PHPMailer\PHPMailer\PHPMailer();
       /*服务器相关信息*/
       $mail->IsSMTP();                 //设置使用SMTP服务器发送
       $mail->SMTPAuth  = true;               //开启SMTP认证
       $mail->Host     = 'smtp.163.com';        //设置 SMTP 服务器,自己注册邮箱服务器地址 QQ则是ssl://smtp.qq.com
       $mail->Port = 25;
       $mail->Username   = 'cat_lkk@163.com';  //发信人的邮箱名称，本人网易邮箱 zzy9i7@163.com 这里就写
       $mail->Password   = 'lishishouquanma1';    //发信人的邮箱密码
       $mail->SMTPSecure = 'tls';
       /*内容信息*/
       $mail->IsHTML(true);               //指定邮件格式为：html *不加true默认为以text的方式进行解析
       $mail->CharSet    ="UTF-8";               //编码
       $mail->From       = 'cat_lkk@163.com';             //发件人完整的邮箱名称
       $mail->FromName   = $name;            //发信人署名
       $mail->Subject    = $subject;               //信的标题
       $mail->MsgHTML($content);                 //发信主体内容
       //$mail->AddAttachment("15.jpg");         //附件
       /*发送邮件*/
       $mail->AddAddress($toemail);              //收件人地址
       //使用send函数进行发送
       if($mail->Send()) {
           return true;
       } else {
          return   $mail->ErrorInfo;

       }
}
//邮箱获取验证码
function emailcode($username)
{
   $vercode=Session::get($username);
   if($vercode){
       Session::delete($username);
   }
   $code=createRandomStr();
   Session::set($username,$code);
   return $code;

}

/**
 * （大小写字母+数字随机组合）
 * @param array $arr    返回值不得包含等于此数组里的值
 * @param string  $length   邀请码长度
 * @param string  $chars    大小写字母+数字
 * @return string
 */
function createRandomStr($arr=array(),$length='4', $chars = '0123456789') {
    $hash = '';
    $max = strlen($chars) - 1;
    for($i = 0; $i < $length; $i++) {
        $hash .= $chars[mt_rand(0, $max)];
    }
    if(in_array($hash,$arr)){
        return createRandomStrs($arr,2);
    }else{
        return $hash;
    }
}

function byte_format($input, $dec=0){
    $prefix_arr = array("B", "KB", "MB", "GB", "TB");
    $value = round($input, $dec);
    $i=0;
    while ($value>1024) {
        $value /= 1024;
        $i++;
    }
    $return_str = round($value, $dec).$prefix_arr[$i];
    return $return_str;
}

function read_all ($dir){
    if(!is_dir($dir)) return false;
    $handle = opendir($dir);

    if($handle){
        while(($fl = readdir($handle)) !== false){
            $temp = $dir.DIRECTORY_SEPARATOR.$fl;
            //如果不加  $fl!='.' && $fl != '..'  则会造成把$dir的父级目录也读取出来
            if(is_dir($temp) && $fl!='.' && $fl != '..'){
                echo '目录：'.$temp.'<br>';
                read_all($temp);
            }else{
                if($fl!='.' && $fl != '..'){

                    echo '文件：'.$temp.'<br>';
                }
            }
        }
    }
}

function getDir($dir) {
    $dirArray[]=NULL;
    if (false != ($handle = opendir ( $dir ))) {
        $i=0;
        while ( false !== ($file = readdir ( $handle )) ) {
            //去掉"“.”、“..”以及带“.xxx”后缀的文件
            if ($file != "." && $file != ".."&&!strpos($file,".")) {
                $dirArray[$i]=$file;
                $i++;
            }
        }
        //关闭句柄
        closedir ( $handle );
    }
    return $dirArray;
}

//获取文件列表
function getFile($dir) {
    $fileArray[]=NULL;
    if (false != ($handle = opendir ( $dir ))) {
        $i=0;
        while ( false !== ($file = readdir ( $handle )) ) {
            //去掉"“.”、“..”以及带“.xxx”后缀的文件
            if ($file != "." && $file != ".."&&strpos($file,".")) {
                $fileArray[$i]=$file;
                if($i==100){
                    break;
                }
                $i++;
            }
        }
        //关闭句柄
        closedir ( $handle );
    }
    return $fileArray;
}
