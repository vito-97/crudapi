<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types = 1);

namespace app\logic;

use app\common\ArrayObject;
use app\common\Util;
use app\model\Category;
use think\model\Relation;

class CategoryLogic extends BaseLogic
{

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return Category::class;
    }

    /**
     * 获取所有一级分类
     * @param $field
     * @return \app\model\BaseModel[]|array|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getTop($field = '*')
    {
        return $this->getModel()->field($field)->where('pid', 0)->scope(['sort'])->select();
    }

    /**
     * 获取一级分类
     * @return array|mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function top()
    {
        static $data = [];

        $key = get_class_name(static::class);

        if (empty($data[$key])) {
            $data[$key] = [];
            $all        = $this->all();

            foreach ($all as $item) {
                if (!$item->pid) {
                    $data[$key][] = $item;
                }
            }
        }

        return $data[$key];
    }

    /**
     * 获取所有分类
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function all()
    {
        $key = get_class_name(static::class);

        static $data = [];

        if (empty($data[$key])) {
            $model = $this->getModel();
            $list  = $model->scope(['status', 'sort'])->select();
            foreach ($list as $item) {
                $data[$key][$item->index] = $item;
            }
        }

        return $data[$key];
    }

    /**
     * 获取指定下标的数据
     * @param $index
     * @return ArrayObject|mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function one($index)
    {
        $data = $this->all();

        return $data[$index] ?? new ArrayObject();
    }

    /**
     * 获取下级
     * @param $index
     * @return array|mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getChildren($index)
    {
        static $data = [];

        $key = get_class_name(static::class);

        if (empty($data[$key])) {
            $all = $this->all();
            /*            $tree = Util::tree($all);

                        $keys       = array_column($tree, 'index');
                        $values     = array_column($tree, 'children');

                        $data[$key] = array_combine($keys, $values);*/
            $top         = [];
            $parentIndex = [];
            foreach ($all as $item) {
                if (!$item->pid) {
                    $top[$item->index]      = [];
                    $parentIndex[$item->id] = $item->index;
                }
            }

            foreach ($all as $item) {
                if ($item->pid) {
                    if (isset($parentIndex[$item->pid])) {
                        $pIdx         = $parentIndex[$item->pid];
                        $top[$pIdx][] = $item;
                    }
                }
            }

            $data[$key] = $top;
        }

        $children = [];

        if (isset($data[$key][$index])) {
            $children = $data[$key][$index];
        }

        return $children;
    }

    /**
     * 获取label
     * @param $field
     * @param $subBefore
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getLabel($field = '*', $subBefore = '└─ ')
    {
        $result = $this->getModel()->field($field)->where('pid', 0)->with([
            'children' => function (Relation $relation) {
                $relation->scope(['sort']);
            }
        ])->scope(['sort'])->select();

        $data = [];

        foreach ($result as $item) {
            $child = $item->children;
//            $item->cid = $child->column('id');
            unset($item->children);
            foreach ($child as $sub) {
                $sub->name = $subBefore . $sub->name;
//                $sub->cid = $sub->id;
            }
            $data = array_merge($data, [$item->toArray()], $child->toArray());
        }

        return $data;
    }

}
