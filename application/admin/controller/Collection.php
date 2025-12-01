<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/6/5 0005
 * Time: 11:24
 */

namespace app\admin\controller;


use logicmodel\CollectionLogic;

class Collection extends BaseController
{
    private $collectionLogic;
    public function __construct()
    {
        parent::__construct();
        $this->collectionLogic = new CollectionLogic();
    }


    /**
     *  团队图谱(节点关系)
     * @param $member
     * @param int $start_level
     * @param int $end_level
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function listGroup($member,$start_level=0,$end_level=0)
    {
        return json($this->collectionLogic->listGroup($member,$start_level,$end_level));

    }


    /**
     * 推荐关系（推荐关系）
     * @param $member
     * @param int $start_level
     * @param int $end_level
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function listRecommand($member,$start_level=0,$end_level=0)
    {
        return json($this->collectionLogic->listRecommand($member,$start_level,$end_level));
    }

}