<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/23 0023
 * Time: 22:43
 */

namespace app\api\controller;

use logicmodel\CurrencyLogic;



class Currency extends BaseController
{
    private $currencyLogic;
    public function __construct()
    {
        parent::__construct();
        $this->currencyLogic = new CurrencyLogic();

    }

    /**
     * 币种列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function  currencyList(){

        return json($this->currencyLogic->currencyList());
    }

}