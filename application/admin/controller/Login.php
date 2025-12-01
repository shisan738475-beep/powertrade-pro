<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/10 0010
 * Time: 13:41
 */

namespace app\admin\controller;


class Login
{
    private  $adminLogic;
    public function __construct()
    {

        $this->adminLogic = new \logicmodel\admin\AdminLogic();
    }


    /**
     * 用户登录
     * @param $name
     * @param $password
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function  login($name,$password)
    {

        return json($this->adminLogic->login($name,$password));
    }

    /**
     * 用户退出
     */
    public function loginOut()
    {
        return json($this->adminLogic->loginOut());

    }


}