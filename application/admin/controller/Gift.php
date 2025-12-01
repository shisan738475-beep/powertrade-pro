<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/12 0012
 * Time: 17:22
 */

namespace app\admin\controller;


use logicmodel\GiftLogic;

class Gift extends BaseController
{
    private $giftLogic;
    public function __construct()
    {
        parent::__construct();
        $this->giftLogic = new GiftLogic();
    }

    /**
     * 礼包配置信息
     * @return \think\response\Json
     */
    public function configGift(){
        return json($this->giftLogic->configGift());
    }

    /**
     * 礼包配置提交
     * @param $currency_id
     * @param $money
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */

    public function configGiftCommit($currency_id,$money){
        return json($this->giftLogic->configGiftCommit($currency_id,$money));
    }

    /**
     * 领取记录列表
     * @param $member
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function giftRecordList($member,$page,$pagesize){
        return json($this->giftLogic->giftRecordList($member,$page,$pagesize));
    }

}