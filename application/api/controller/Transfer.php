<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/11 0011
 * Time: 11:10
 */

namespace app\api\controller;


use logicmodel\api\TransferLogic;
use validate\TransferValidate;

class Transfer extends BaseController
{

    private $transferLogic;
    public function __construct()
    {
        parent::__construct();
        $this->transferLogic = new TransferLogic();
    }


    /**
     * 会员转账配置信息
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function configTransferList()
    {
        return json($this->transferLogic->configTransferList());
    }

    /**
     * 转账申请
     * @param $transfer_id
     * @param $target_member
     * @param $money
     * @param $pay_password
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function transferCommit($transfer_id,$target_member,$money,$pay_password)
    {
        (new TransferValidate())->goCheck();
        return json($this->transferLogic->transferCommit(request()->_userInfo,$transfer_id,$target_member,$money,$pay_password));
    }

    /**
     * 转账记录
     * @param $type  1=转出,2=转入
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function transferRecordList($type){
        return json($this->transferLogic->transferRecordList(request()->_uid,$type));
    }

}