<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/12/14 0014
 * Time: 17:56
 */

namespace app\api\controller;


use logicmodel\api\ConvertLogic;

class Convert extends BaseController
{
    private  $convertLogic;
    public function __construct()
    {
        parent::__construct();
        $this->convertLogic  = new ConvertLogic();

    }

    /**
     * 兑换配置列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function configConvertList()
    {
        return json($this->convertLogic->configConvertList(request()->_uid));
    }

    /**
     * 币种兑换
     * @param $convert_id
     * @param $money
     * @param $pay_password
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function convertCommit($convert_id,$money,$pay_password)
    {
        return json($this->convertLogic->convertCommit(request()->_userInfo,$convert_id,$money,$pay_password));
    }


    /**
     * 兑换记录
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function convertRecordList(){
        return json($this->convertLogic->convertRecordList(request()->_uid));
    }
}