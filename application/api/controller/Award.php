<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/10 0010
 * Time: 17:22
 */

namespace app\api\controller;


use logicmodel\AwardRecordLogic;

class Award extends BaseController
{
    private $awardRecordLogic;
    public function __construct()
    {
        parent::__construct();
        $this->awardRecordLogic = new AwardRecordLogic();
    }

    /**
     * 奖金明细
     * @param $award_id
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function awardRecordList($award_id,$page,$pagesize){
        return json($this->awardRecordLogic->awardRecordList(request()->_uid,$award_id,$page,$pagesize));
    }

}