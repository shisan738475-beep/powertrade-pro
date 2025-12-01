<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/10
 * Time: 10:48
 */

namespace app\admin\controller;

use logicmodel\admin\RoleAdminLogic;
use think\facade\Request;


class Roleadmin extends BaseController
{
    private  $roleAdminLogic;
    public function __construct()
    {
        parent::__construct();
        $this->roleAdminLogic = new RoleAdminLogic();
    }

    /**
     * 后台角色列表 get
     */
    public function  roleAdminList()
    {

        return json($this->roleAdminLogic->getRoleAdminList());

    }


    /**
     * 后台角色添加
     * @param $name; 角色名称
     * @param $remark; 备注
     * @return \think\response\Json
     * @throws \think\Exception
     */
    public function addRoleAdmin($name,$remark='')
    {
        return json($this->roleAdminLogic->addRoleAdmin($name,$remark));
    }


    /**
     * 角色授权及提交
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function empowerRoleAdmin()
    {
        $data = input();
        if (Request::isGet()){
            return json($this->roleAdminLogic->empowerRoleAdmin($data['id']));
        }
        return json($this->roleAdminLogic->empowerRoleAdminCommit($data['id'],$data['rules']));

    }

    /**
     * 角色编辑及提交
     * @param $id
     * @param $name
     * @param $remark
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function editRoleAdminCommit($id,$name,$remark)
    {

        return json($this->roleAdminLogic->editRoleAdminCommit($id,$name,$remark));

    }


    /**
     * 角色删除
     * @param $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function  deleteRoleAdmin($id)
    {
        return json($this->roleAdminLogic->deleteRoleAdmin($id));
    }
}