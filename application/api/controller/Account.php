<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/10 0010
 * Time: 15:53
 */

namespace app\api\controller;


use logicmodel\AccountLogic;

class Account extends BaseController
{

    private $accountLogic;
    public function __construct()
    {
        parent::__construct();
        $this->accountLogic = new AccountLogic();
    }

    /**
     * 会员账户余额
     * @return \think\response\Json
     */
    public function userAccount(){
        return json($this->accountLogic->userAccount(request()->_userInfo));
    }


}