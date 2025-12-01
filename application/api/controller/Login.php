<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/6/20 0020
 * Time: 15:39
 */

namespace app\api\controller;


use logicmodel\api\UserLogic;
use logicmodel\SendLogic;
use validate\api\ForgetValidate;
use validate\api\GestureValidate;
use validate\api\RegisterValidate;

class Login
{

    private $userLogic;
    public function __construct()
    {
        $this->userLogic = new UserLogic();
    }

    /**
     * 会员登陆
     * @param string $member
     * @param string $password
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function login(string $member,string $password)
    {
        return json($this->userLogic->login($member,$password));
    }


    /**
     * 发送短信
     * @param $phone
     * @return \think\response\Json
     */
    public function sendSms($phone)
    {
       return json((new SendLogic())->sendSms($phone));
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
    public function register($uuid,$phone,$member,$nick_name,$password,$pay_password,$gesture_password){
        (new RegisterValidate())->goCheck();
        return json($this->userLogic->register($uuid,$phone,$member,$nick_name,$password,$pay_password,$gesture_password));
    }

    /**
     * 重置密码
     * @param $phone
     * @param $member
     * @param $pay_password
     * @param $password
     * @return \think\response\Json
     * @throws \app\lib\exception\ParamException
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function forgetPassword($phone,$member,$pay_password,$password)
    {
        (new ForgetValidate())->goCheck();
        return json($this->userLogic->forgetPassword($phone,$member,$pay_password,$password));

    }
    /**
     * 重置手势密码
     * @param $member
     * @param $password
     * @param $pay_password
     * @param $gesture_password
     * @return \think\response\Json
     * @throws \app\lib\exception\ParamException
     */
    public function forgetGesturePassword($member,$password,$pay_password,$gesture_password){
        (new GestureValidate())->goCheck();
        return json($this->userLogic->forgetGesturePassword($member,$password,$pay_password,$gesture_password));
    }

}
