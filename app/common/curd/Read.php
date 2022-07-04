<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/25
 * Time: 10:09
 */

namespace app\common\curd;

use app\exception\DataNotFoundException;
use app\validate\IDMustBeIntValidate;

class Read extends BaseCurd
{
    //需要展示的字段
    protected $field = [];
    //排除字段
    protected $withoutField = false;
    //追加输出的属性
    protected $append = [];

    //条件
    protected $where = [];

    protected $validate = [IDMustBeIntValidate::class];

    //数据场景
    protected $scene = '';

    /**
     * 获取数据详情
     * @return bool
     * @throws DataNotFoundException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function query()
    {
        $obj = $this->getObj();

        if (!$obj) {
            throw new DataNotFoundException();
        }

        $this->formatModel($obj);

        $this->setData('detail', $obj);

        return true;
    }
}