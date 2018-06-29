<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Session;
use think\Controller;
use think\Config;
use \tp5er\Backup;
use think\Paginator;
class Database extends Controller
{
    public function index()
    {
        $db= new Backup();
        $list=$db->dataList();
        //var_dump($list);
        $this->assign('list',$list);
        return $this->fetch();

    }

    public function edit()
    {
        $db= new Backup();
        $id=input('id');
        $url=input('url');
        if($url='optimize'){
            if($db->optimize($id))
            {
                $result['info'] = '修复成功!';
                $result['status'] = 200;
                return $result;
            }else{
                $result['info'] = '修复成功!';
                $result['status'] = 400;
                return $result;
            }
        }else{
            if($db->repair($id))
            {
                $result['info'] = '优化成功!';
                $result['status'] = 200;
                return $result;
            }else{
                $result['info'] = '优化成功!';
                $result['status'] = 400;
                return $result;
            }
        }
    }

    public function Backup()
    {
        $config=array(
            'path'     => './Data/',//数据库备份路径
            'part'     => 20971520,//数据库备份卷大小
            'compress' => 0,//数据库备份文件是否启用压缩 0不压缩 1 压缩
            'level'    => 9 //数据库备份文件压缩级别 1普通 4 一般  9最高
        );
        $db= new Backup($config);
        $tables = input('tables/a');
        foreach($tables as $key=>$table) {
            $file=['name'=>date('Ymd-His'),'part'=>1];
            $start= $db->setFile($file)->backup($table, 0);
        }
        if($start==0){
            $result['info'] = '成功备份数据库!';
            $result['status'] =200;
            return $result;
        }else{
            $result['info'] = '备份数据库失败!';
            $result['status'] = 400;
            return $result;
        }

    }

    public function importlist()
    {
        $config=array(
            'path'     => './Data/',//数据库备份路径
            'part'     => 20971520,//数据库备份卷大小
            'compress' => 0,//数据库备份文件是否启用压缩 0不压缩 1 压缩
            'level'    => 9 //数据库备份文件压缩级别 1普通 4 一般  9最高
        );
        $db= new Backup($config);
        $list=$db->fileList();
        $this->assign('list',$list);
        return $this->fetch();
    }

    public function downFile() {
        $config=array(
            'path'     => './Data/',//数据库备份路径
            'part'     => 20971520,//数据库备份卷大小
            'compress' => 0,//数据库备份文件是否启用压缩 0不压缩 1 压缩
            'level'    => 9 //数据库备份文件压缩级别 1普通 4 一般  9最高
        );
        $db= new Backup($config);

        var_dump($db->$config['path']);die;


    }





}
