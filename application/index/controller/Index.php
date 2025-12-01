<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/6/6 0006
 * Time: 14:27
 */

namespace app\index\controller;

use think\facade\Log;
use think\facade\Request;

class Index
{
    public function index(){
 /*      $url =  Request::instance()->domain();
       echo $url;*/
        $time = time();
        Log::info('调用时间：'.$time);
    }

}