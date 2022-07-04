<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\water_company\controller\v1;

use app\common\Enum;
use app\validate\AllInPayValidate;
use app\water_company\controller\BaseController;
use app\logic\AllInPayLogic;

class AllInPay extends BaseController
{
    protected $name = '通联支付';

//    protected $registerCurd = ['read', 'save', 'update', 'edit'];

//    protected $registerCurdDir = 'pay';

    protected $agentScope = false;

    /**
     * 初始化
     */
    protected function initialize()
    {
        $this->logic = new AllInPayLogic();
    }

    public function read()
    {
        $detail = $this->getDetail();

        return $this->success(['detail' => $detail], '获取成功');
    }

    public function update()
    {
        $params             = $this->request->put();
        $params['agent_id'] = $this->uid();
        AllInPayValidate::batchCheck($params, Enum::VALID_SAVE_SCENE);

        $detail = $this->getDetail();

        $detail->setAttrs($params);

        $status = $detail->save();

        if ($status) {
            return $this->success([], '修改成功');
        } else {
            return $this->error([], '修改失败');
        }
    }


    protected function getDetail()
    {
        $detail = $this->logic->where('agent_id', $this->uid())->find() ?: new \app\model\AllInPay();

        if($detail->isEmpty()){
            $detail->append([]);
        }

        return $detail;
    }
}
