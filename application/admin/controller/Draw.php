<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/26 0026
 * Time: 16:18
 */

namespace app\admin\controller;


use logicmodel\DrawLogic;

class Draw extends BaseController
{
    private $drawLogic;
    public function __construct()
    {
        parent::__construct();
        $this->drawLogic = new DrawLogic();
    }

    /**
     * 提现审核列表
     * @param $status
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
    public function drawList($status,$member,$start_time,$end_time,$page,$pagesize)
    {
        return json($this->drawLogic->drawList($status,$member,$start_time,$end_time,$page,$pagesize));
    }

    /**
     * 提现审核通过
     * @param $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function drawPass($id)
    {
        return json($this->drawLogic->drawPass($id));
    }

    /**
     * 提现申请拒绝
     * @param $id
     * @param $refuse
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function drawNoPass($id,$refuse)
    {
        return json($this->drawLogic->drawNoPass($id,$refuse));
    }
}