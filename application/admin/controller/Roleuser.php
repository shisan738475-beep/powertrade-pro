<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/10
 * Time: 10:48
 */

namespace app\admin\controller;

use logicmodel\admin\RoleUserLogic;


class Roleuser extends BaseController
{
    private  $roleUserLogic;
    public function __construct()
    {
        parent::__construct(); 
        $this->roleUserLogic = new RoleUserLogic();
    }

    /**
     * 前台角色列表 get
     */
    public function roleUserList()
    {
        return json($this->roleUserLogic->roleUserList());

    }

    /**
     * 角色添加
     * @param string $name 角色名称
     * @param string $remark 备注
     * @return \think\response\Json
     */
    public function addRoleUserCommit(string $name,string $remark)
    {
        return json($this->roleUserLogic->addRoleUserCommit($name,$remark));
    }




    /**
     * 角色编辑提交
     * @param int $id
     * @param string $name
     * @param string $remark
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function editRoleUserCommit(int $id,string $name,string $remark)
    {

        return json($this->roleUserLogic->editRoleUserCommit($id,$name,$remark));

    }



    /**
     * 前台角色删除
     * @param int $id 角色ID
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function  deleteRoleUser(int $id)
    {
        return json($this->roleUserLogic->deleteRoleUser($id));
    }








}