<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/6/3 0003
 * Time: 14:43
 */

namespace app\admin\controller;


use logicmodel\AccountLogic;
use logicmodel\admin\UserLogic;
use logicmodel\finance\FeeLogic;


class User extends BaseController
{
    private $userLogic;
    private $accountLogic;
    private $feeLogic;
    public function __construct()
    {
        parent::__construct();
        $this->userLogic = new UserLogic();
        $this->accountLogic = new AccountLogic();
        $this->feeLogic = new FeeLogic();
    }


    /**
     * 会员列表
     * @param $role_id
     * @param int $rank_id 级别ID
     * @param string $member 会员账号
     * @param string $start_time 开始时间
     * @param string $end_time 结束时间
     * @param int $page 页码
     * @param int $pagesize 单页展示数量
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function userList( $role_id,$rank_id,string $member,string $start_time,string $end_time,int $page,int $pagesize)
    {
        return json($this->userLogic->userList($role_id,$rank_id,$member,$start_time,$end_time,$page,$pagesize));
    }

    /**
     * 会员账户余额信息
     * @param int $id
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function userAccount(int $id)
    {
        return json($this->accountLogic->account($id));
    }

    /**
     * 后台充值
     * @param int $id
     * @param string $member
     * @param int $currency_id
     * @param float $money
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function investCommit(int $id,string $member,int $currency_id,float $money)
    {
        return json($this->feeLogic->investCommit($id,$member,$currency_id,$money));
    }

    /**
     * 后台扣费
     * @param int $id
     * @param int $currency_id
     * @param string $member
     * @param float $money
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function deductionCommit(int $id,string $member,int $currency_id,float $money)
    {
        return json($this->feeLogic->deductionCommit($id,$member,$currency_id,$money));
    }

    /**
     * 重置密码
     * @param  int $id 会员ID
     * @param string $password  密码
     * @param string $password_re 确认密码
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
   public function resetPassword(int $id,string $password,string $password_re)
   {
        return json($this->userLogic->resetPassword($id,$password,$password_re));
   }


    /**
     * 重置支付密码
     * @param int $id 会员ID
     * @param string $pay_password 支付密码
     * @param string $pay_password_re 确认支付密码
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
   public function resetPayPassword(int $id,string $pay_password,string $pay_password_re)
   {
       return json($this->userLogic->resetPayPassword($id,$pay_password,$pay_password_re));
   }

    /**
     * 修改会员状态
     * @param $id
     * @param $status
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
   public function updateStatus($id,$status){
        return json($this->userLogic->updateStatus($id,$status));
   }

    /**
     * 修改会员角色
     * @param $id
     * @param $role_id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
   public function updateUserRole($id,$role_id){
        return json($this->userLogic->updateUserRole($id,$role_id));
   }


    /**
     * 修改会员杠杆钱包
     * @param $id
     * @param $lever_account
     * @return \think\response\Json
     */
   public function updateUserLever($id,$lever_account){
    return json($this->userLogic->updateUserLever($id,$lever_account));
   }
}