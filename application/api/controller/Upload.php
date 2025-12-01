<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/6/24 0024
 * Time: 15:58
 */

namespace app\api\controller;


use logicmodel\UploadLogic;
use think\facade\Request;
use think\facade\Response;

class Upload
{
    private $uploadLogic;

    public function __construct()
    {
        $this->uploadLogic = new UploadLogic();
    }

    /**
     * base64图片上传
     * @param $image
     * @return \think\response\Json
     */
    public function baseUpload($image)
    {
        return json($this->uploadLogic->baseUpload($image));
    }

    /**
     * file文件上传
     * @return \think\response\Json
     */
    public function fileUpload()
    {
        $image = Request::file('image');
        return json($this->uploadLogic->fileUpload($image));
    }

}