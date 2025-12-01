<?php

namespace app\http\middleware;
use app\lib\exception\LoginException;
use comservice\GetRedis;
use datamodel\User;
use enum\CommonEnum;
use think\facade\Request;

class checkApiLogin
{
    public function handle($request, \Closure $next)
    {
        $item = config('globals.item');
        $token = Request::header('token');
        if (empty($token) || $token==''){
            throw new LoginException();
        }
        $redis = GetRedis::getRedis();

        $uid = $redis->getItem($item.'-'.$token);
        if (empty($uid) || $uid == false || !$uid){
            throw new LoginException();
        }
        $request->_uid = $uid;
        //验证冻结状态
        $field = ['u.*','r.name rank_name'];
        $where [] = ['u.id','=',$uid];
        $userInfo = (new User())->alias('u')
            ->join('rank r','u.rank_id = r.id')
            ->field($field)
            ->where($where)
            ->find();
        if(!$userInfo){
            throw new LoginException(['msg'=>'当前账户不存在']);
        }
        if($userInfo['status'] == CommonEnum::$forbid){
            throw new LoginException(['msg'=>'当前账户已被冻结,请联系推荐人']);
        }
        $member = $userInfo['member'];
        $request->_member = $member;
        $request->phone = $member;
        $request->_rank_id = $userInfo['rank_id'];
        $request->_userInfo = $userInfo;
        return $next($request);

    }
}
