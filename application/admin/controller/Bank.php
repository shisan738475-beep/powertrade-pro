<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/6/3 0003
 * Time: 15:30
 */

namespace app\admin\controller;


use logicmodel\BankLogic;
use think\facade\Request;

class Bank extends BaseController
{

    private  $bankLogic;

    public function __construct()
    {
        parent::__construct();
        $this->bankLogic = new BankLogic();
    }

    /**
     * 银行列表
     * @param int $type 银行类型 1:充值汇款银行  2:提现银行
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function bankList(int $type)
    {
        return json($this->bankLogic->bankList($type));
    }


    /**
     * 添加银行卡
     * @param string $name  银行名称
     * @param string $number 卡号
     * @param string $phone 银行预留手机号
     * @param string $opening 开户行
     * @param string $opener 开户人
     * @param int $type
     * @return \think\response\Json
     */
    public function  addBankCommit(string $name,string $number,string $phone,string $opening,string $opener,int $type)
    {

        return json($this->bankLogic->addBankCommit($name,$number,$phone,$opening,$opener,$type));

    }

    /**
     * 编辑银行卡提交
     * @param int $id
     * @param string $name
     * @param string $number
     * @param string $phone
     * @param string $opening
     * @param string $opener
     * @param int $type
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function  editBankCommit(int $id,string $name,string $number,string $phone,string $opening,string $opener,int $type)
    {

        return json($this->bankLogic->editBankCommit($id,$name,$number,$phone,$opening,$opener,$type));

    }


    /**
     *  删除银行卡
     * @param  int $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function deleteBank(int $id)
    {
        return json($this->bankLogic->deleteBank($id));
    }

}