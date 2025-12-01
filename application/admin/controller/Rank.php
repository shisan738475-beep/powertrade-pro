<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/6/3 0003
 * Time: 14:16
 */

namespace app\admin\controller;


use logicmodel\RankLogic;
use think\facade\Request;

class Rank extends BaseController
{

    private $rankLogic;
    public function __construct()
    {
        parent::__construct();
        $this->rankLogic = new RankLogic();
    }

    /**
     * 等级列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function  rankList()
    {
        return json($this->rankLogic->rankList());
    }


    /**
     * 编辑级别提交
     * @param $id
     * @param $name
     * @param $remark
     * @param $invest_money
     * @param $team_rank_id
     * @param $team_rank_number
     * @param $sales_number
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function  editRankCommit($id,$name, $remark,$invest_money,$team_rank_id,$team_rank_number,$sales_number)
    {
        return json($this->rankLogic->editRankCommit($id,$name,$remark,$invest_money,$team_rank_id,$team_rank_number,$sales_number));
    }


}