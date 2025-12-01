<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/6/18 0018
 * Time: 15:25
 */

namespace app\admin\controller;


use logicmodel\ServiceLogic;

class Service extends BaseController
{

    private $serviceLogic;
    public function __construct()
    {
        parent::__construct();
        $this->serviceLogic = new ServiceLogic();
    }

    /**
     * 客服列表
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function serviceList()
    {
        return json($this->serviceLogic->serviceList());
    }

    /**
     * 新增客服
     * @param $name
     * @param $qq
     * @param $wx_qrcode
     * @param $phone
     * @return array
     */
    public function addService($name,$qq,$wx_qrcode,$phone)
    {
        return json($this->serviceLogic->addService($name,$qq,$wx_qrcode,$phone));
    }

    /**
     * 编辑提交
     * @param $id
     * @param $name
     * @param $qq
     * @param $wx_qrcode
     * @param $phone
     * @return array
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function editServiceCommit($id,$name,$qq,$wx_qrcode,$phone)
    {
        return json($this->serviceLogic->editServiceCommit($id,$name,$qq,$wx_qrcode,$phone));
    }

    /**
     * 删除客户
     * @param $id
     * @return array
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function deleteService($id)
    {
        return json($this->serviceLogic->deleteService($id));
    }


}