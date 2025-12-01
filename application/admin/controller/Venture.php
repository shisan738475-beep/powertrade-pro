<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/8 0008
 * Time: 17:12
 */

namespace app\admin\controller;

use logicmodel\VentureLogic;

class Venture extends BaseController
{
    private $ventureLogic;
    public function __construct()
    {
        parent::__construct();
        $this->ventureLogic = new VentureLogic();
    }

    /**
     * 投资列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function ventureRecordList(){
        return json($this->ventureLogic->ventureRecordList());
    }

    /**
     * 新增记录
     * @param $content
     * @return \think\response\Json
     */
    public function addVentureRecord($content){
        return json($this->ventureLogic->addVentureRecord($content));
    }

    /**
     * 删除记录
     * @param $id
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function deleteVentureRecord($id){
        return json($this->ventureLogic->deleteVentureRecord($id));
    }

}