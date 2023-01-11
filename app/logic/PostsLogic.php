<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types = 1);

namespace app\logic;

use app\common\ArrayObject;
use app\model\Posts;

class PostsLogic extends BaseLogic
{

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return Posts::class;
    }

    /**
     * 通过分类获取文章
     * @param $index
     * @param $args
     * @return \app\model\BaseModel|\app\model\BaseModel[]|array|\think\Collection|\think\db\BaseQuery|\think\Paginator
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getListByCate($index, $args = [])
    {
        $categoryLogic = new PostsCategoryLogic();
        $cate          = $categoryLogic->one($index);

        if (!$cate) {
            return [];
        }

        $args = array_merge_recursive($args, $this->getArgsByCate($index));

        return $this->getAll($args);
    }

    /**
     * 获取一条数据
     * @param $index
     * @return \app\model\BaseModel|Posts|array|mixed|\think\db\BaseQuery|\think\Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function one($index)
    {
        $categoryLogic = new PostsCategoryLogic();
        $cate          = $categoryLogic->one($index);

        if (!$cate) {
            return new Posts();
        }

        $args = $this->getArgsByCate($index);

        return $this->getModel()->getQuery($args)->find();
    }

    /**
     * 获取查询参数
     * @param $index
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function getArgsByCate($index)
    {
        $args          = [];
        $categoryLogic = new PostsCategoryLogic();

        $cate = $categoryLogic->one($index);

        if (!$cate) {
            return [];
        }

        $children = $categoryLogic->getChildren($index);

        $ids = array_merge([$cate['id']], array_column($children, 'id'));

        if (empty($args['where'])) {
            $args['where'] = [];
        }

        $args['scope']   = [' status', 'sort'];
        $args['where'][] = ['category_id', 'IN', $ids];
        $args['where'][] = ['create_time', '<=', time()];

        return $args;
    }
}
