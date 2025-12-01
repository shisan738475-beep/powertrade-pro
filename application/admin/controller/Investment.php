<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/12 0012
 * Time: 17:57
 */

namespace app\admin\controller;


use logicmodel\InvestmentLogic;

class Investment extends BaseController
{
    private $investmentLogic;
    public function __construct()
    {
        parent::__construct();
        $this->investmentLogic = new InvestmentLogic();
    }

    /**
     * 套餐列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function investmentList(){
        return json($this->investmentLogic->investmentList());
    }

    /**
     * 新增套餐
     * @param $name
     * @param $base_price
     * @param $price
     * @param $rate
     * @param $is_show
     * @return \think\response\Json
     */
    public function addInvestment($name,$base_price,$price,$rate,$is_show){
        return json($this->investmentLogic->addInvestment($name,$base_price,$price,$rate,$is_show));
    }

    /**
     * 编辑套餐
     * @param $id
     * @param $name
     * @param $base_price
     * @param $price
     * @param $rate
     * @param $is_show
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function editInvestmentCommit($id,$name,$base_price,$price,$rate,$is_show){
        return json($this->investmentLogic->editInvestmentCommit($id,$name,$base_price,$price,$rate,$is_show));
    }

    /**
     * 删除套餐
     * @param $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function deleteInvestment($id){
        return json($this->investmentLogic->deleteInvestment($id));
    }

    /**
     * 投资记录
     * @param $member
     * @param $investment_id
     * @param $start_time
     * @param $end_time
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function investmentRecordList($member,$investment_id,$start_time,$end_time,$page,$pagesize){
        return json($this->investmentLogic->investmentRecordList($member,$investment_id,$start_time,$end_time,$page,$pagesize));
    }

}