<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/6/18 0018
 * Time: 15:26
 */

namespace app\admin\controller;


use logicmodel\NoticeLogic;

class Notice  extends BaseController
{
    private $noticeLogic;
    public function __construct()
    {
        parent::__construct();
        $this->noticeLogic = new NoticeLogic();
    }


    /**
     * 系统公告列表
     * @param string $title  标题
     * @param string $start_time 开始时间
     * @param string $end_time 结束时间
     * @param int $page 当前页码
     * @param int $pagesize 单页展示量
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function noticeList( $title, $start_time, $end_time,int $page,int$pagesize)
    {
        return json($this->noticeLogic->noticeList($title,$start_time,$end_time,$page,$pagesize));
    }

    /**
     * 新增公告
     * @param $title
     * @param $content
     * @param $order
     * @return \think\response\Json
     */
    public function addNoticeCommit(string $title,string $content,int $order)
    {
        return json($this->noticeLogic->addNoticeCommit($title,$content,$order));
    }

    /**
     * 公告编辑
     * @param int $id
     * @return \think\response\Json
     */
    public function editNotice(int $id)
    {
        return json($this->noticeLogic->editNotice($id));
    }

    /**
     * 公告编辑提交
     * @param int $id
     * @param string $title
     * @param string $content
     * @param int $order
     * @param string $create_time
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function editNoticeCommit(int $id,string $title,string $content,int $order,string $create_time)
    {
        return json($this->noticeLogic->editNoticeCommit($id,$title,$content,$order,$create_time));
        
    }

    /**
     * 删除公告
     * @param int $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function deleteNotice(int  $id)
    {
        return json($this->noticeLogic->deleteNotice($id));
    }
}