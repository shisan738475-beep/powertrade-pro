<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/3 0003
 * Time: 17:06
 */

namespace app\lib\exception;


use think\Exception;


class BaseException extends Exception
{
    public $code = 400;
    public $msg  = '参数错误';
    public $errcode = 4000;

    public function __construct($data=[])
    {
        parent::__construct();
        if (array_key_exists('code',$data)) $this->code = $data['code'];
        if (array_key_exists('msg',$data)) $this->msg = $data['msg'];
        if (array_key_exists('errcode',$data)) $this->errcode = $data['errcode'];
    }
}