<?php
namespace app\api\controller\v1;
use think\Controller;
use think\Request;
use app\api\controller\Api;
use think\Response;
use app\api\controller\UnauthorizedException;
use think\Db;

class News extends Api
{
    public function read()
    {
        $id = input('id');
        $model = model('News');
        $data = $this->getNews($id);// 查询数据
        if ($data) {
            $code = 200;
        } else {
            $code = 404;
        }
        $data = [
            'code' => $code,
            'data' => $data
        ];
        return json($data);
    }

    public function getNews($id = 1)
    {
        $res = Db::name('article')->where('id', $id)->select();
        // echo $this->getLastSql();
        return $res;
    }
}
