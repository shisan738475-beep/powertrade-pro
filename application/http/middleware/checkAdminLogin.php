<?php

namespace app\http\middleware;


use app\lib\exception\LoginException;
use think\facade\Session;

class checkAdminLogin
{
    public function handle($request, \Closure $next)
    {
        $item = config('globals.item');
        //判断登陆情况
        Session::set($item.'-'.'admin_id',1);
        if(!Session::has($item.'-'.'admin_id'))
        {
            throw new LoginException();
        }
        $request->admin_id = Session::get($item.'-'.'admin_id');
        return $next($request);
    }


}
