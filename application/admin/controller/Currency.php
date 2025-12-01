<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/10
 * Time: 10:48
 */

namespace app\admin\controller;


use logicmodel\CurrencyLogic;


class Currency extends BaseController
{
    private $currencyLogic;


    public function __construct()
    {
        parent::__construct();
        $this->currencyLogic = new CurrencyLogic();


    }

    /**币种信息展示
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function currencyList()
    {
        return json($this->currencyLogic->currencyList());
    }

    /**
     * 编辑币种提交
     * @param int $id
     * @param float $rate
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function editCurrencyCommit( $id,  $rate)
    {
        return json($this->currencyLogic->editCurrencyCommit($id,$rate));
    }

}