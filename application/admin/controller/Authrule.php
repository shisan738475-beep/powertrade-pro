<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/6/2 0002
 * Time: 16:09
 */

namespace app\admin\controller;


use logicmodel\admin\AuthRuleLogic;

class Authrule  extends BaseController
{
    private  $authRuleLogic;


    public  function __construct()
    {
        parent::__construct();
        $this->authRuleLogic = new AuthRuleLogic();

    }
    /**
     * 菜单权限列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function authRuleList()
    {
            return json($this->authRuleLogic->authRuleMenuList());
    }

    /**
     * 添加权限
     * @param int $pid  上级权限ID 顶级权限为0
     * @param string $url url路径
     * @param string $name 名称
     * @param string $remark 备注
     * @param int $order 排序
     * @param int $is_menu 菜单：0=不是,1=是
     * @param string $action
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function  addAuthRuleCommit(int $pid,string $url,string $name,string $remark,int $order,int $is_menu,string $action)
    {

        return json($this->authRuleLogic->addAuthRuleCommit($pid,$url,$name,$remark,$order,$is_menu,$action));

    }


    /**
     * 权限编辑提交
     * @param int $id
     * @param int $pid
     * @param string $url
     * @param string $name
     * @param string $remark
     * @param int $order
     * @param int $is_menu
     * @param string $action
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function  editAuthRuleCommit(int $id,int $pid,string $url,string $name,string $remark,int $order,int $is_menu,string $action)
    {

        return json($this->authRuleLogic->editAuthRuleCommit($id,$pid,$url,$name,$remark,$order,$is_menu,$action));

    }

    /**
     * 删除权限
     * @param int $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function deleteAuthRule(int $id)
    {

        return json($this->authRuleLogic->deleteAuthRule($id));
    }


}