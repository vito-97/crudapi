<?php
declare (strict_types=1);

namespace app\logic;

use app\model\SystemConfigTab;


class SystemConfigTabLogic extends BaseLogic
{

    /**
     * 设置模型
     * @return string
     */
    protected function getModelName(): string
    {
        return SystemConfigTab::class;
    }

    /**
     * 获取下拉框的数据
     * @return \app\model\BaseModel|\app\model\BaseModel[]|array|\think\Collection|\think\Paginator
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getLabel()
    {
        $args = [
            'with' => [
                //关联下级类
                'child' => function ($query) {
                    $query->field(['id', 'title', 'pid'])->hidden(['pid']);
                },
            ],
            'field' => ['id,title'],
            'scope' => ['status'],
            'where' => ['pid' => 0],
            'limit' => 0,
        ];
        return $this->getAll($args);
    }

}
