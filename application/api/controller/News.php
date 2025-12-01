<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/10 0010
 * Time: 15:43
 */

namespace app\api\controller;


use logicmodel\NewsLogic;

class News extends BaseController
{
    private $newsLogic;
    public function __construct()
    {
        parent::__construct();
        $this->newsLogic = new NewsLogic();
    }

    /**
     * 新闻列表
     * @param int $page
     * @param int $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function news($page=1,$pagesize=10){

        return json($this->newsLogic->news($page,$pagesize));
    }
}