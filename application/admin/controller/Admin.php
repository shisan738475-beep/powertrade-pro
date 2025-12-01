<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/11 0011
 * Time: 17:33
 */

namespace app\admin\controller;
use logicmodel\admin\AdminLogic;
use think\facade\Request;
use validate\AdminValidate;
use validate\PasswordValidate;


class Admin extends BaseController
{
    private  $adminLogic;

    public function __construct()
    {
        parent::__construct();
        $this->adminLogic = new AdminLogic();



    }


    /**管理员列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function adminList()
    {

        return json($this->adminLogic->adminList());

    }

    /**
     * 后台管理员添加
     * @method POST
     * @param  string $name 名称
     * @param string $account 账号
     * @param string $password 密码
     * @param string $email 邮箱
     * @param string $phone 手机号
     * @param int $role_id 角色Id
     * @return \think\response\Json
     * @throws \think\Exception
     */

    public function addAdminCommit($name,$account,$password,$email,$phone,$role_id)
    {

        (new AdminValidate())->goCheck();
         return json($this->adminLogic->addAdminCommit($name,$account,$password,$email,$phone,$role_id));
    }


    /**
     * 编辑管理员及提交
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function editAdmin()
    {

        $data = input();
        if (Request::isGet()){

            return json($this->adminLogic->editAdmin($data['id']));
        }
       // (new AdminValidate())->goCheck();
        return json($this->adminLogic->editAdminCommit($data['id'],$data['name'],$data['account'],$data['email'],$data['phone'],$data['role_id']));

    }


    /**
     * 删除管理员
     * @param $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function  deleteAdmin($id)
    {
        return json($this->adminLogic->deleteAdmin($id));
    }

    /**
     *重置密码 post
     * @param $id; 管理员ID
     * @param $password; 新密码
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resetPassword($id,$password)
    {
        (new PasswordValidate())->goCheck();
        return json($this->adminLogic->resetPassword($id,$password));
    }



}