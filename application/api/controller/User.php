<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/7 0007
 * Time: 15:56
 */

namespace app\api\controller;


use comservice\Response;
use logicmodel\api\UserLogic;
use validate\api\EditPasswordValidate;
use validate\api\EditPayPasswordValidate;

class User extends BaseController
{

    private $userLogic;
    public function __construct()
    {
        parent::__construct();
        $this->userLogic = new UserLogic();
    }

    /**
     * 验证手势密码
     * @param $gesture_password
     * @return \think\response\Json
     */
    public function checkGesture($gesture_password)
    {
        return json($this->userLogic->checkGesture(request()->_userInfo,$gesture_password));
    }

    /**
     * 会员基本信息
     * @return \think\response\Json
     */
    public function userInfo(){
        return json($this->userLogic->userInfo(request()->_userInfo));
    }

    /**
     * 修改个人信息
     * @param $nick_name
     * @param $head_image
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function editUserInfo($nick_name,$head_image){
        return json($this->userLogic->editUserInfo(request()->_uid,$nick_name,$head_image));
    }

    /**
     * 重置登录密码
     * @param $old_password
     * @param $password
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function editPassword($old_password,$password){
        //验证密码
        (new EditPasswordValidate())->goCheck();
        return json($this->userLogic->editPassword(request()->_userInfo,$old_password,$password));
    }

    /**
     * 重置支付密码
     * @param $old_pay_password
     * @param $pay_password
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function editPayPassword($old_pay_password,$pay_password){
        //验证
        (new EditPayPasswordValidate())->goCheck();
        return json($this->userLogic->editPayPassword(request()->_userInfo,$old_pay_password,$pay_password));
    }

    /**
     * 推荐人员信息
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
     public function teamInfo(){
        return json($this->userLogic->teamInfo(request()->_uid));
    }

    /**
     * 获取手势密码
     * @return \think\response\Json
     */
    public function gesturePassword(){
         return json(Response::success('',['gesturePassword'=>request()->_userInfo['gesture_password']]));
    }



}