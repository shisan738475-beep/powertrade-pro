<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/3 0003
 * Time: 17:09
 */

namespace app\lib\exception;


use Exception;
use think\exception\Handle;
use think\facade\Request;

class HttpException extends Handle
{
    private $code;
    private $msg;
    private $errcode;

    /**
     * 自定义错误异常
     * @param Exception $e
     * @return \think\Response|\think\response\Json
     * @throws Exception
     */
    public function render(Exception $e)
    {
        $debug =  config('app.app_debug');

       if ($e instanceof BaseException)
       {
            $this->code = $e->code;
            $this->msg = $e->msg;
            $this->errcode = $e->errcode;
       } else {
           $this->code = 200;
           $this->errcode = 5000;
         if (!$debug){
             //上线环境
             $this->msg = '系统错误';
             $this->errorLog($e);
         } else {
            //测试环境  正常抛出错误
             return parent::render($e);
         }
       }
        $result = [
            'msg' => $this -> msg,
            'errcode' => $this ->errcode,
        ];
        return json($result,$this ->code);

    }

    /**
     * 日志记录错误信息
     * @param Exception $e
     * @throws Exception
     */
    private function errorLog(Exception $e)
    {
        $log_filename =  '../runtime/service/' . date('Y-m-d') . ".log";
        $t = microtime(true);
        $micro = sprintf("%06d", ($t - floor($t)) * 1000000);
        $d = new \DateTime (date('Y-m-d H:i:s.' . $micro, $t));
        file_put_contents($log_filename, '   ' . $d->format('Y-m-d H:i:s ') .'url:'.Request::instance()->url().'     错误信息： '. $e->getMessage() . "\r\n------------------------ \r\n", FILE_APPEND);
    }

}