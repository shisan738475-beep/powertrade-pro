<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/6/20 0020
 * Time: 15:39
 */

namespace app\api\controller;


use think\Controller;

class BaseController extends Controller
{

    protected $uid;
    protected $middleware = ['checkApiLogin'];
    public function __construct()
    {
        parent::__construct();
        $this->uid = 1;
    }
}