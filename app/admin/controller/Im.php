<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
use think\facade\Session;
use think\facade\Cookie;
use think\facade\Config）;
use think\response\Redirect;
class Im extends Common
{
    public function index()
    {
      $list= Db::name('qun')->alias('q')->join('user u','q.owner_id = u.id')->field('q.*,u.username')->select();
      $this->assign('list',$list);
      return $this->fetch();
    }

    public function add()
    {
        if (request()->isPost()){
            $data['groupname']=input('groupname');
            $data['avatar']=input('avatar');
            $data['owner_id']=input('owner_id');
            $data['uids']=input('uids');
            $res=Db::name('qun')->insertGetId($data);
            $uids=explode(',',$data['uids']);
            foreach ($uids as $v) {
                Db::name('user_qun')->insert(['uid'=>$v,'qid'=>$res]);
            }
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
            $list=Db::name('user')->select();
            $this->assign('list',$list);
            return $this->fetch();
        }

    }

    public function edit()
    {
        if (request()->isPost()){
            $data['groupname']=input('groupname');
            $data['avatar']=input('avatar');
            $data['owner_id']=input('owner_id');
            $data['uids']=input('uids');
            $id=input('id');
            $res=Db::name('qun')->where('id',$id)->update($data);
            Db::name('user_qun')->where('qid',$id)->delete();
            $uids=explode(',',$data['uids']);
            foreach ($uids as $v) {
                Db::name('user_qun')->insert(['uid'=>$v,'qid'=>$id]);
            }
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
            $qun=Db::name('qun')->where('id',$id)->find();
            $this->assign('qun',$qun);

            $list=Db::name('user')->select();
            $this->assign('list',$list);
            return $this->fetch();
        }
    }


    public function show()
    {
        $id=input('id');
        $qun=Db::name('qun')->where('id',$id)->find();
        $uids=explode(',',$qun['uids']);

        foreach ($uids as $v) {
        $user[]=Db::name('user')->where('id',$v)->find();
        }
        $this->assign('qun',$qun);
        $this->assign('user',$user);
      return $this->fetch();
    }

    public function remove()
    {
        $id=input('id');
        $qid=input('qid');
        $qun=Db::name('qun')->where('id',$qid)->find();
        if($qun){
            $uids=explode(',',$qun['uids']);
            $key=array_search($id ,$uids);
            array_splice($uids,$key,1);
            $uids=implode(',',$uids);
            Db::name('qun')->where('id',$qid)->update(['uids'=>$uids]);
            $find=Db::name('user_qun')->where('uid',$id)->where('qid',$qid)->find();
            if($find){
                $res=Db::name('user_qun')->where('id',$find['id'])->delete();
                if($res){
                    $result['info'] = '删除成功!';
                    $result['status'] = 200;
                    return $result;
                }else{
                    $result['info'] = '删除失败!';
                    $result['status'] = 400;
                    return $result;
                }
            }else{
                $result['info'] = '删除失败!';
                $result['status'] = 400;
                return $result;
            }
        }
    }
    public function users()
    {
        $catData=Db::name('user')->select();
        $data=array();
        foreach ($catData as $k=> $v) {
            $data[]=array(
                'id'=>$v['id'],
                'name'=>$v['username']
            );
        }
        return json($data);
    }
//---------------聊天系统---------------
    public function chat()
    {
        $uid=Session::get('uid');
        $admin=Db::name('admin')->where('id',$uid)->find();
        if($admin){
            $mine = Db::name('user')->where('id', $admin['id'])->find();
        }else{
            $mine =array(
               'id'=>time(),
               'username'=>'临时'.time(),
               'avatar'=>'http://tp1.sinaimg.cn/1241679004/180/5743814375/0',
               'sign'=>''
           );


        }
        $this->assign([
                'uinfo' => $mine
        ]);
		return $this->fetch();
    }

    public function msgbox()
    {

        return $this->fetch();
    }

    public function find()
    {

      return $this->fetch();
    }



    //聊天记录详情
    public function chatlog()
    {
        $id = input('id');
        $list=Db::name('chatlog')->where('toid',$id)->where('type','group')->order('timeline desc')->select();
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function detail()
    {
        $id = input('id');
        $type = input('type');
        $admin=Session::get('admin');
        $uid = $admin['id'];
        if( 'friend' == $type ){
            $result = Db::name('chatlog')->where("((fromid={$uid} and toid={$id}) or (fromid={$id} and toid={$uid})) and type='friend'")
                ->order('timeline desc')
                ->select();

            if( empty($result) ){
                return json( ['code' => -1, 'data' => '', 'msg' => '没有记录'] );
            }

            return json( ['code' => 1, 'data' => $result, 'msg' => 'success'] );
        }else if('group' == $type){

            $result = Db::name('chatlog')->where("toid={$id} and type='group'")
                ->order('timeline desc')
                ->select();

            if( empty($result) ){
                return json( ['code' => -1, 'data' => '', 'msg' => '没有记录'] );
            }

            return json( ['code' => 1, 'data' => $result, 'msg' => 'success'] );
        }


    }

    public function getList()
    {
        //查询自己的信息
        $admin=Session::get('admin');
        $uid=$admin['id'];
        $mine = Db::name('user')->where('id', $uid)->find();
        $friend=array();
        $friend=Db::name('mgroup')->where('uid', $uid)->select();
        if($friend){
            foreach ($friend as $k => $v){
                $mid=explode(',',$v['mid']);
                $friend[$k]['online']=2;
                foreach($mid as $f=>$uid) {
                $list[$f]=Db::name('user')->where('id', $uid)->find();
                }
                $friend[$k]['list']=$list;
            }
        }
        $groupArr=array();

        $qun=Db::name('user_qun')->where('uid', $admin['id'])->select();

        if($qun){
                foreach ($qun as $q) {
                    $groupArr[]=Db::name('qun')->where('id', $q['qid'])->find();
                }
        }
        $return = [
            'code' => 0,
            'msg'=> '',
            'data' => [
                'mine' => [
                        'username' => $mine['username'],
                        'id' => $mine['id'],
                        'status' => 'online',
                        'sign' => $mine['sign'],
                        'avatar' =>$mine['avatar']
                ],
                'friend' => $friend,
                'group' => $groupArr
            ],
        ];
        return json( $return );

    }

    //获取组员信息
    public function getMembers()
    {
    	$id = input('param.id');
        $qun=Db::name('qun')->where('id',$id)->find();

    	//群主信息
    	$owner =Db::name('user')->field('nickname,id,avatar ,sign')->where('id',$qun['owner_id'])->find();
    	//$owner = db('chatgroup')->field('owner_name,owner_id,owner_avatar,owner_sign')->where('id = ' . $id)->find();
    	//群成员信息
        $uids=explode(',',$qun['uids']);
        foreach ($uids as $v) {
            $list[] = Db::name('user')->field('id,nickname username,avatar,sign')->where('id',$v)->find();
        }

    	// $list = db('groupdetail')->field('userid id,username,useravatar avatar,usersign sign')
    	// ->where('groupid = ' . $id)->select();

    	$return = [
    			'code' => 0,
    			'msg' => '',
    			'data' => [
    				'owner' => [
    						'username' => $owner['nickname'],
    						'id' => $owner['id'],
    						'owner_id' => $owner['avatar'],
    						'sign' => $owner['sign']
    				],
    				'list' => $list
    			]
    	];

    	return json( $return );
    }




}
