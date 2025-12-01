<?php


namespace app\admin\controller;

use logicmodel\Awardlogic;
use think\Request;

class Award
{
    private $awardLogic;

    public function __construct()
    {
        $this->awardLogic=new Awardlogic();

    }

    /**
     * 奖项列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function awardList()
    {
        return json($this->awardLogic->awardList());
    }


    /**
     * 奖项开启/关闭  0=关闭,1=开启
     * @param int $id
     * @param int $status
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function  updateStatus(int $id, int $status)
    {
        return json($this->awardLogic->updateStatus($id,$status));
    }

    /**
     * 分红奖配置信息
     * @return \think\response\Json
     */
    public function configBonusList(){
        return json($this->awardLogic->configBonusList());
    }

    /**
     * 分红奖配置提交
     * @param $id
     * @param $rate
     * @return \think\response\Json
     */
    public function configBonusCommit($id,$rate){
        return json($this->awardLogic->configBonusCommit($id,$rate));
    }

    /**
     * 二级分销设置
     * @return \think\response\Json
     */
    public function configSalesList(){
        return json($this->awardLogic->configSalesList());
    }

    /**
     * 二级分销设置提交
     * @param $id
     * @param $rate
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function configSalesCommit($id,$rate){
        return json($this->awardLogic->configSalesCommit($id,$rate));
    }

    /**
     * 团队奖励列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function configTeamList(){
        return json($this->awardLogic->configTeamList());
    }

    /**
     * 新增团队奖励
     * @param $number
     * @param $floor
     * @param $rate
     * @return \think\response\Json
     */
    public function addConfigTeam($number,$floor,$rate){
        return json($this->awardLogic->addConfigTeam($number,$floor,$rate));
    }

    /**
     * 团队奖励编辑
     * @param $id
     * @param $number
     * @param $floor
     * @param $rate
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function configTeamCommit($id,$number,$floor,$rate){
        return json($this->awardLogic->configTeamCommit($id,$number,$floor,$rate));
    }

    /**
     * 团队奖配置删除
     * @param $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function deleteConfigTeam($id){
        return json($this->awardLogic->deleteConfigTeam($id));
    }
    /**
     * 管理奖励列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function configManageList(){
        return json($this->awardLogic->configManageList());
    }

    /**
     * 新增管理奖励
     * @param $rank_id
     * @param $rate
     * @return \think\response\Json
     */
    public function addConfigManage($rank_id,$rate){
        return json($this->awardLogic->addConfigManage($rank_id,$rate));
    }

    /**
     * 管理奖励编辑
     * @param $id
     * @param $rank_id
     * @param $rate
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function configManageCommit($id,$rank_id,$rate){
        return json($this->awardLogic->configManageCommit($id,$rank_id,$rate));
    }

    /**
     * 管理奖奖配置删除
     * @param $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function deleteConfigManage($id){
        return json($this->awardLogic->deleteConfigManage($id));
    }
    /**
     * 辅导奖励列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function configTutorList(){
        return json($this->awardLogic->configTutorList());
    }

    /**
     * 新增辅导奖励
     * @param $rank_id
     * @param $rate
     * @return \think\response\Json
     */
    public function addConfigTutor($rank_id,$rate){
        return json($this->awardLogic->addConfigTutor($rank_id,$rate));
    }

    /**
     * 辅导奖励编辑
     * @param $id
     * @param $rank_id
     * @param $rate
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function configTutorCommit($id,$rank_id,$rate){
        return json($this->awardLogic->configTutorCommit($id,$rank_id,$rate));
    }

    /**
     * 辅导奖配置删除
     * @param $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function deleteConfigTutor($id){
        return json($this->awardLogic->deleteConfigTutor($id));
    }

}