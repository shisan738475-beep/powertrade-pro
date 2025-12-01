<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/14 0014
 * Time: 21:06
 */

namespace app\api\controller;


use logicmodel\api\RemittanceLogic;

class Remittance extends BaseController
{
    private $remittanceLogic;
    public function __construct()
    {
        parent::__construct();
        $this->remittanceLogic = new RemittanceLogic();
    }

    /**
     * 汇款配置信息
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function configRemittanceList(){
        return json($this->remittanceLogic->configRemittanceList());
    }

    /**
     * 汇款提交
     * @param $money
     * @param $pay_voucher
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function remittanceCommit($money,$pay_voucher){
        return json($this->remittanceLogic->remittanceCommit(request()->_uid,request()->_member,$money,$pay_voucher));
    }

    /**
     * 汇款记录
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function remittanceRecordList(){
        return json($this->remittanceLogic->remittanceRecordList(request()->_uid));
    }

}