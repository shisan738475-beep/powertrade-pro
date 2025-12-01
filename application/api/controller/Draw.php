<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/26 0026
 * Time: 10:25
 */

namespace app\api\controller;


use logicmodel\api\DrawLogic;

class Draw extends BaseController
{
    private $drawLogic;
    public function __construct()
    {
        parent::__construct();
        $this->drawLogic = new DrawLogic();
    }

    /**
     * 会员提现配置列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function configDrawList()
    {
        return json($this->drawLogic->configDrawList());
    }

    /**
     * 会员发起提现
     * @param int $draw_id
     * @param float $money
     * @param $address
     * @param $pay_password
     * @param $image
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function drawCommit($draw_id, $money,$address,$pay_password,$image='')
    {
        return json($this->drawLogic->drawCommit(request()->_userInfo,$draw_id,$money,$address,$image,$pay_password));
    }

    /**
     * 提现记录
     * @param $status
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function drawRecordList($status){
        return json($this->drawLogic->drawRecordList(request()->_uid,$status));
    }

}