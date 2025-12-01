<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/6/20 0020
 * Time: 15:39
 */

namespace app\api\controller;

use logicmodel\BannerLogic;
use logicmodel\GiftLogic;
use logicmodel\NoticeLogic;
use logicmodel\VentureLogic;

class Index extends BaseController
{

    private $bannerLogic;
    private $ventureLogic;
    private $noticeLogic;
    private $giftLogic;
    public function __construct()
    {
        parent::__construct();
        $this->bannerLogic = new BannerLogic();
        $this->ventureLogic = new VentureLogic();
        $this->noticeLogic = new NoticeLogic();
        $this->giftLogic = new GiftLogic();
    }

    /**
     * 轮播图列表
     * @param $type 类型
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function banner($type){
        return json($this->bannerLogic->banner($type));
    }

    /**
     * 创投记录列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function ventureList(){
        return json($this->ventureLogic->ventureRecordList());
    }
    /**
     * 系统消息轮播
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function notice(){
        return json($this->noticeLogic->notice());
    }


    /**
     * 宝箱领奖
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function gift(){
        return json($this->giftLogic->gift(request()->_uid,request()->_member));
    }
}