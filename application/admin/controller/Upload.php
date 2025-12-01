<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/6/24 0024
 * Time: 15:58
 */

namespace app\admin\controller;


use logicmodel\UploadLogic;
use think\facade\Request;

class Upload
{
    private $uploadLogic;

    public function __construct()
    {
        $this->uploadLogic = new UploadLogic();
    }

    /**
     * 图片二进制上传
     * @param $image
     * @return \think\response\Json
     */
    public function baseUpload($image)
    {
        return json($this->uploadLogic->baseUpload($image));
    }

    /**
     * 图片file文件上传
     * @return \think\response\Json
     */
    public function fileUpload()
    {
        $file = Request::file('image');
        return  json($this->uploadLogic->fileUpload($file));
    }

}