<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/9 0009
 * Time: 18:02
 */

namespace app\admin\controller;


use logicmodel\BannerLogic;

class Banner extends BaseController
{
    private $bannerLogic;
    public function __construct()
    {
        parent::__construct();
        $this->bannerLogic = new BannerLogic();
    }

    /**
     * 轮播图列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function bannerList()
    {
        return json($this->bannerLogic->bannerList());
    }

    /**
     * 轮播图添加
     * @param $image
     * @param $order
     * @param $type
     * @return \think\response\Json
     */
    public function addBanner($image,$order,$type)
    {
        return json($this->bannerLogic->addBanner($image,$order,$type));
    }

    /**
     * 轮播图编辑提交
     * @param $id
     * @param $image
     * @param $order
     * @param $type
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function  editBannerCommit($id,$image,$order,$type)
    {
        return json($this->bannerLogic->editBannerCommit($id,$image,$order,$type));
    }

    /**
     * 轮播图删除
     * @param $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function deleteBanner($id)
    {
        return json($this->bannerLogic->deleteBanner($id));
    }
}