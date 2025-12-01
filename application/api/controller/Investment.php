<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/12 0012
 * Time: 18:02
 */

namespace app\api\controller;


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
        return json($this->investmentLogic->investment());
    }

    /**
     * 会员投资
     * @param $type
     * @param $investment_id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function investmentConfirm($type,$investment_id){
        return json($this->investmentLogic->investmentConfirm(request()->_userInfo,$type,$investment_id));
    }

    /**
     * 投资列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function investmentRecord(){
        return json($this->investmentLogic->investmentRecord(request()->_uid));
    }

}