<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/9 0009
 * Time: 18:57
 */

namespace app\admin\controller;


use logicmodel\MailLogic;

class Mail extends BaseController
{
    private $mailLogic;
    public function __construct()
    {
        parent::__construct();
        $this->mailLogic = new MailLogic();
    }


    /**
     * 发件箱
     * @param $member
     * @param $start_time
     * @param $end_time
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function sendList($member,$start_time,$end_time,$page,$pagesize)
    {
        return json($this->mailLogic->sendList($member,$start_time,$end_time,$page,$pagesize));
    }

    /**
     * 发件箱删除
     * @param $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function deleteSend($id)
    {
        return json($this->mailLogic->deleteSend($id));
    }

    /**
     * 收件箱
     * @param $member
     * @param $start_time
     * @param $end_time
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function receiveList($member,$start_time,$end_time,$page,$pagesize)
    {
        return json($this->mailLogic->receiveList($member,$start_time,$end_time,$page,$pagesize));
    }
    /**
     * 收件箱删除
     * @param $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function deleteReceive($id)
    {
        return json($this->mailLogic->deleteReceive($id));
    }

    /**
     * 回复邮件
     * @param $id
     * @param $title
     * @param $content
     * @return \think\response\Json
     */
    public function receive($id,$title,$content)
    {
        return json($this->mailLogic->receive($id,$title,$content));
    }

    /**
     * 发送站内信
     * @param $uid
     * @param $member
     * @param $title
     * @param $content
     * @return \think\response\Json
     */
    public function mail($uid,$member,$title,$content){
        return json($this->mailLogic->mail($uid,$member,$title,$content));
    }

}