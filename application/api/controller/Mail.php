<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/10 0010
 * Time: 19:21
 */

namespace app\api\controller;


use logicmodel\MailLogic;

class Mail extends BaseController
{
    private $_mailLogic;
    public function __construct()
    {
        parent::__construct();
        $this->_mailLogic = new MailLogic();
    }

    /**
     * 发件箱
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function userSend()
    {
        return json($this->_mailLogic->userSend(request()->_uid));
    }

    /**
     * 收件箱
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function userReceive()
    {
        return json($this->_mailLogic->userReceive(request()->_uid));
    }

    /**
     * 发送邮件
     * @param $title
     * @param $content
     * @param $image
     * @return \think\response\Json
     */
    public function sendMail($title,$content,$image)
    {
        return json($this->_mailLogic->sendMail(request()->_uid,request()->_member,$title,$content,$image));
    }


}