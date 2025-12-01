<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/27
 * Time: 17:04
 */

namespace app\admin\controller;


use logicmodel\api\UserLogic;
use validate\admin\RegisterValidate;

class Member extends BaseController
{

    private $userLogic;
    public function __construct()
    {
        parent::__construct();
        $this->userLogic = new UserLogic();
    }

    /**
     * 会员注册
     * @param $uuid
     * @param $phone
     * @param $member
     * @param $nick_name
     * @param $password
     * @param $pay_password
     * @param $gesture_password
     * @return \think\response\Json
     * @throws \app\lib\exception\ParamException
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function register($uuid,$phone,$member,$nick_name,$password,$pay_password){
        (new RegisterValidate())->goCheck();
        return json($this->userLogic->register($uuid,$phone,$member,$nick_name,$password,$pay_password));
    }
    /**
     * 获取注册账号
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function member()
    {
        return json($this->userLogic->member());
    }

}