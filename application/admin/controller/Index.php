<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/10 0010
 * Time: 14:45
 */

namespace app\admin\controller;
use logicmodel\admin\AuthRuleLogic;
use logicmodel\StatisticsLogic;

class Index  extends BaseController
{

    private $authRuleLogic;
    private $statisticsLogic;
   public function __construct()
    {
        parent::__construct();

        $this->authRuleLogic = new AuthRuleLogic();
        $this->statisticsLogic = new StatisticsLogic();
    }


    /**
     * 管理员权限列表
     * @return \think\response\Json
     */
    public function index()
    {
        return json($this->authRuleLogic->roleAuthRuleList($this->admin_role_id));
    }

    /**
     * 平台统计信息
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function statistics(){
        return json($this->statisticsLogic->statistics());
    }

}