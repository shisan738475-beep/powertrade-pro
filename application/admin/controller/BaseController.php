<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/10 0010
 * Time: 13:40
 */

namespace app\admin\controller;
use think\Controller;
use think\facade\Session;

class BaseController extends Controller
{
    protected  $admin_id;
    protected $middleware = ['checkAdminLogin'];
    protected $admin_role_id;
    public function __construct()
    {
        parent::__construct();
        $item = config('globals.item');
        $this->admin_role_id = Session::get($item.'-'.'admin_role_id');

    }

}