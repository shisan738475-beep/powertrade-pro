<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/6/4 0004
 * Time: 14:19
 */

namespace app\admin\controller;

use logicmodel\FinanceLogic;
use think\facade\Request;

/**
 * 财务参数设置
 * Class Finance
 * @package app\admin\controller
 */
class Finance extends BaseController
{
    private  $financeLogic;
    public function __construct()
    {
        parent::__construct();
        $this->financeLogic = new FinanceLogic();
    }

    /**
     * 财务参数设置
     * @param $type  2：转账 4：汇款
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function financeList($type)
    {
        return json($this->financeLogic->financeList($type));

    }

    /**
     * 充值扣费设置
     * @param $type
     * @return \think\response\Json
     */
    public function feeList($type)
    {
        return json($this->financeLogic->feeList($type));
    }

    /**
     * 兑换设置
     * @return \think\response\Json
     */
    public function convert()
    {
        return json($this->financeLogic->convert());
    }

    /**
     * 兑换设置提交
     * @param $id
     * @param $dog_ids
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function convertCommit($id,$dog_ids)
    {
        return json($this->financeLogic->convertCommit($id,$dog_ids));
    }

    /**
     * 新增配置信息
     * @return \think\response\Json
     */
    public function  addFinance()
    {
        $data = input('post.');
        return json($this->financeLogic->addFinance($data));
    }

    /**
     * 编辑配置信息提交
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function editFinance()
    {

        if (Request::isGet()){
            $data = input('get.');
            return json($this->financeLogic->editFinance($data['type'],$data['id']));
        }
        $data = input('post.');
        return json($this->financeLogic->editFinanceCommit($data));
    }

    /**
     * 后台 充值/扣费 设置提交
     * @param $type
     * @param $currency_ids
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function editFeeCommit($type,$currency_ids)
    {
        return json($this->financeLogic->editFeeCommit($type,$currency_ids));
    }

    /**
     * 删除配置信息
     * @param $type
     * @param $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function deleteFinance($type,$id)
    {
        return json($this->financeLogic->deleteFinance($type,$id));
    }

}