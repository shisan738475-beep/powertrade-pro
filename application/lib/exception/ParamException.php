<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/3 0003
 * Time: 17:25
 */

namespace app\lib\exception;


class ParamException extends BaseException
{
    public $code = 200;
    public $msg  = '参数错误';
    public $errcode = 4000;

}