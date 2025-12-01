<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
function infinityCategory($data,$pid=0)
{
   $ruleArr = [];
    foreach ($data as $k=>$v) {
        if ($v['pid'] == $pid) {
            $v['lower'] = infinityCategory($data,$v['id']);
            $ruleArr [] = $v;
          unset($data[$k]);
        }
    }
    return $ruleArr;

}

//生成唯一字符串
 function  uniqueNum()
{
    $yCode = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
    $order_no =
        $yCode[intval(date('Y')) - 2019] . strtoupper(dechex(date('m'))) . date(
            'd') . substr(time(), -5) . substr(microtime(), 2, 5) . sprintf(
            '%02d', rand(0, 99));
    return $order_no.time();
}

function bug($data)
{
    echo "<pre/>";
    dump($data);
    die;
}
/**
 * 根据条件筛选数据
 * @param array $data 初始数据
 * @param array $conditionData 条件数据
 * @return array
 */
function filterDistance($data,$conditionData)
{
    $arr = [];
    foreach ($data as $k=>$v){
        foreach ($conditionData as $key=>$value){

            if ($value[1] == '>'){
                if ($v[$value[0]] <= $value[2]){
                    continue 2;
                }
            } elseif($value[1] == '='){
                if ($v[$value[0]]  != $value[2]){
                    continue 2 ;
                }
            } elseif($value[1] == '<'){
                if ($v[$value[0]] >= $value[2]){
                    continue 2;
                }
            } elseif ($value[1] == '>=')
            {
                if ($v[$value[0]] < $value[2]){
                    continue 2;
                }

            } elseif($value[1] == '<='){
                if ($v[$value[0]] > $value[2]){
                    continue 2 ;
                }
            }

        }
        $arr [] = $v;
    }
    return $arr;
}

    /**
     * 生成唯一账号
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    function member()
    {
        $d = rand(111111,999999);
        $userInfo = (new \datamodel\User())->where(['uuid'=>$d])->find();
        if ($userInfo){
            return uuid();
        }
        return 'CAGI'.$d;
    }
/**
 * 生成会员邀请码
 * @return string
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\ModelNotFoundException
 * @throws \think\exception\DbException
 */
    function uuid()
    {
        $code="ABCDEFGHIGKLMNOPQRSTUVWXYZ";
        $rand=$code[rand(0,25)].strtoupper(dechex(date('m'))) .date('d').substr(time(),-5) .substr(microtime(),2,5).sprintf('%02d',rand(0,99));
        for(
            $a = md5( $rand, true ),
            $s = '0123456789ABCDEFGHIJKLMNOPQRSTUV',
            $d = '',
            $f = 0;
            $f < 8;
            $g = ord( $a[ $f ] ), // ord（）函数获取首字母的 的 ASCII值
            $d .= $s[ ( $g ^ ord( $a[ $f + 8 ] ) ) - $g & 0x1F ],
            $f++ );

        $userInfo = (new \datamodel\User())->where(['uuid'=>$d])->find();
        if ($userInfo){
            return uuid();
        }
        return $d;
    }
