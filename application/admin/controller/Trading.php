<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/6/5 0005
 * Time: 17:52
 */

namespace app\admin\controller;

use logicmodel\TradingLogic;

/**
 * 审核记录
 * Class Trading
 * @package app\admin\controller
 */
class Trading extends BaseController
{
    private $tradingLogic;

    public function __construct()
    {
        parent::__construct();
        $this->tradingLogic = new TradingLogic();
    }

    /**
     *汇款 审核列表
     * @param $status
     * @param $member
     * @param $currency_id
     * @param $start_time
     * @param $end_time
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function remittanceRecordList($status,$member,$currency_id,$start_time,$end_time,$page,$pagesize)
    {

        return json($this->tradingLogic->remittanceRecordList($status,$member,$currency_id,$start_time,$end_time,$page,$pagesize));

    }

    /**
     * 汇款审核通过
     * @param $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function remittancePass($id)
    {
        return json($this->tradingLogic->remittancePass($id));
    }

    /**
     * 汇款审核拒绝
     * @param $id
     * @param $refuse
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function  remittanceNoPass($id,$refuse)
    {
        return json($this->tradingLogic->remittanceNoPass($id,$refuse));
    }

    /**
     * 发奖记录
     * @param $member
     * @param $award_id
     * @param $page
     * @param $start_time
     * @param $end_time
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function awardRecord($member,$award_id,$start_time,$end_time,$page,$pagesize)
    {
        return json($this->tradingLogic->awardRecord($member,$award_id,$start_time,$end_time,$page,$pagesize));
    }

    /**
     * 后台充值记录
     * @param $member
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function investRecord($member,$page,$pagesize)
    {
        return json($this->tradingLogic->investRecord($member,$page,$pagesize));
    }

    /**
     * 后台扣费记录
     * @param $member
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function deductionRecord($member,$page,$pagesize)
    {
        return json($this->tradingLogic->deductionRecord($member,$page,$pagesize));
    }

    /**
     * 转账记录
     * @param $member
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function transferRecord($member,$page,$pagesize)
    {
        return json($this->tradingLogic->transferRecord($member,$page,$pagesize));
    }

    /**
     * 账单流水
     * @param $type
     * @param $member
     * @param $currency_id
     * @param $start_time
     * @param $end_time
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function billList($type,$currency_id,$member,$start_time,$end_time,$page,$pagesize)
    {
        return json($this->tradingLogic->billList($type,$currency_id,$member,$start_time,$end_time,$page,$pagesize));
    }

    /**
     * 财务统计
     * @return \think\response\Json
     */
    public function  moneyCensus()
    {
        return json($this->tradingLogic->moneyCensus());
    }

}