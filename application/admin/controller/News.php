<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/10 0010
 * Time: 15:37
 */

namespace app\admin\controller;


use logicmodel\NewsLogic;

class News extends BaseController
{

    private  $newsLogic;
    public function __construct()
    {
        parent::__construct();
        $this->newsLogic = new NewsLogic();
    }

    /**
     * 新闻列表
     * @param $title
     * @param $start_time
     * @param $end_time
     * @param $page
     * @param $pagesize
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function newsList($title,$start_time,$end_time,$page,$pagesize){
        return json($this->newsLogic->newsList($title,$start_time,$end_time,$page,$pagesize));
    }

    /**
     * 新增新闻
     * @param $title
     * @param $image
     * @param $content
     * @param $create_time
     * @param $order
     * @param $desc
     * @return \think\response\Json
     */
    public function addNews($title,$image,$content,$create_time,$order,$desc){
        return json($this->newsLogic->addNews($title,$image,$content,$create_time,$order,$desc));
    }

    /**
     * 编辑新闻提交
     * @param $id
     * @param $title
     * @param $image
     * @param $content
     * @param $create_time
     * @param $order
     * @param $desc
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function editNews($id,$title,$image,$content,$create_time,$order,$desc){
        return json($this->newsLogic->editNews($id,$title,$image,$content,$create_time,$order,$desc));
    }

    /**
     * 删除新闻
     * @param $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function deleteNews($id){
        return json($this->newsLogic->deleteNews($id));
    }
}