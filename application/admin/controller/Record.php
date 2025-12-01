<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/18 0018
 * Time: 17:22
 */

namespace app\admin\controller;


use logicmodel\RecordLogic;

class Record extends BaseController
{
    private  $recordLogic;
    public function __construct()
    {
        parent::__construct();
        $this->recordLogic = new RecordLogic();
    }

    /**
     * 汇款记录
     * @param $status
     * @param $currency_id
     * @param $member
     * @param $start_time
     * @param $end_time
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function remittanceList($status,$currency_id,$member,$start_time,$end_time,$page,$pagesize)
    {
        return json($this->recordLogic->remittanceList($status,$currency_id,$member,$start_time,$end_time,$page,$pagesize));

    }

    /**
     * 提现记录
     * @param $status
     * @param $currency_id
     * @param $member
     * @param $start_time
     * @param $end_time
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function drawList($status,$currency_id,$member,$start_time,$end_time,$page,$pagesize)
    {
        return json($this->recordLogic->drawList($status,$currency_id,$member,$start_time,$end_time,$page,$pagesize));
    }

    /**
     * 转账记录
     * @param $currency_id
     * @param $member
     * @param $target_member
     * @param $start_time
     * @param $end_time
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function transferList($currency_id,$member,$target_member,$start_time,$end_time,$page,$pagesize)
    {
        return json($this->recordLogic->transferList($currency_id,$member,$target_member,$start_time,$end_time,$page,$pagesize));
    }

    /**
     * 兑换记录
     * @param $member
     * @param $currency_id
     * @param $target_currency_id
     * @param $start_time
     * @param $end_time
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function convertList($member,$currency_id,$target_currency_id,$start_time,$end_time,$page,$pagesize)
    {
        return json($this->recordLogic->convertList($member,$currency_id,$target_currency_id,$start_time,$end_time,$page,$pagesize));
    }

    /**
     * 充值记录
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
    public function investList($member,$currency_id,$start_time,$end_time,$page,$pagesize)
    {
        return json($this->recordLogic->investList($member,$currency_id,$start_time,$end_time,$page,$pagesize));

    }

    /**
     * 扣费记录
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
    public function deductionList($member,$currency_id,$start_time,$end_time,$page,$pagesize)
    {
        return json($this->recordLogic->deductionList($member,$currency_id,$start_time,$end_time,$page,$pagesize));
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
    public function billList($type,$member,$currency_id,$start_time,$end_time,$page,$pagesize)
    {
        return json($this->recordLogic->billList($type,$member,$currency_id,$start_time,$end_time,$page,$pagesize));
    }
    /**
     * 发奖记录
     * @param $member
     * @param int $currency_id
     * @param $award_id
     * @param $from_member
     * @param $start_time
     * @param $end_time
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function awardList($member,$currency_id,$award_id,$from_member,$start_time,$end_time,$page,$pagesize)
    {
        return json($this->recordLogic->awardList($member,$currency_id,$award_id,$from_member,$start_time,$end_time,$page,$pagesize));
    }
}