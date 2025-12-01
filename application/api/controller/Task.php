<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/3/15 0015
 * Time: 14:46
 */

namespace app\api\controller;


use logicmodel\award\Bonus;
use logicmodel\award\Manage;
use logicmodel\award\Sales;
use logicmodel\award\Team;
use logicmodel\award\Tutor;

class Task
{
    private $bonusAward;
    public function __construct()
    {
        $this->bonusAward = new Bonus();
    }

    /**
     * 日分红
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function bonusAward(){
        $this->bonusAward->sendAward();
    }
}