<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/10 0010
 * Time: 16:30
 */

namespace app\api\controller;


use logicmodel\BillLogic;

class Bill extends BaseController
{

    private $billLogic;
    public function __construct()
    {
        parent::__construct();
        $this->billLogic = new BillLogic();
    }

    /**
     * 财务明细
     * @param $currency_id
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function billList($currency_id,$page,$pagesize){
        return json($this->billLogic->billList(request()->_uid,$currency_id,$page,$pagesize));
    }

}