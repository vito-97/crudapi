<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/30
 * Time: 16:54
 */

namespace app\command;


use app\common\Enum;
use think\console\command\Make;
use think\console\Input;
use think\console\input\Option;
use think\console\Output;
use think\helper\Str;

/**
 * 生成CRUD类
 * php think make:crud admin@user/User
 * --only read,save  只允许生成read和save
 * --except read 排除read
 * Class MakeCrud
 * @package app\command
 */
class MakeCrud extends Make
{
    protected $crud = Enum::CRUD;

    protected $allow = [];

    protected $currentCrud;

    protected $basic = 'common';

    protected function configure()
    {
        parent::configure();
        $this->setName('make:crud')
            ->addOption('only', null, Option::VALUE_OPTIONAL, '只生成的CRUD方法')
            ->addOption('except', null, Option::VALUE_OPTIONAL, '排除的CRUD方法')
            ->addOption('namespace', null, Option::VALUE_OPTIONAL, '命名空间')
            ->addOption('basic', null, Option::VALUE_OPTIONAL, 'CRUD基类');
    }

    protected function execute(Input $input, Output $output)
    {
        $this->setAllowCruds();

        if ($input->getOption('basic')) {
            $this->basic = $input->getOption('basic');
        }

        $names     = $this->getNames($input->getArgument('name'));
        $namespace = $this->formatNamespace($input->getOption('namespace'));

        foreach ($this->allow as $method) {

            $this->currentCrud = $method;
            $this->type        = 'crud ' . $method;

            foreach ($names as $name) {
                $input->setArgument('name', $namespace . $name);
                parent::execute($input, $output);
            }
        }

        $output->writeln('生成CRUD类完成');
    }

    protected function buildClass(string $name)
    {
        $data = parent::buildClass($name);

        return str_replace(['{%basic%}'], [$this->basic], $data);
    }

    protected function getClassName(string $name): string
    {
        $app = '';

        if (strpos($name, '@') !== false) {
            [$app, $name] = explode('@', $name);
        }

        // 没有设置目录则将目录设置为自身的名字
        if (strpos($name, '/') === false) {
            $name = Str::snake($name) . '/' . $name;
        }

        $className = ($app ? $app . '@' : '') . $name;

        return parent::getClassName($className) . ucfirst($this->currentCrud);
    }

    protected function getNamespace(string $app): string
    {
        return 'app' . ($app ? '\\' . $app : '') . '\crud';
    }

    /**
     * 获取需要生成的文件
     * @return string
     */
    protected function getStub()
    {
        return __DIR__ . DIRECTORY_SEPARATOR . 'stubs/crud_' . $this->currentCrud . '.stub';
    }

    /**
     * 设置要生成的CRUD类
     * @return $this
     */
    protected function setAllowCruds()
    {
        $allow = $this->crud;

        $only   = $this->input->getOption('only');
        $except = $this->input->getOption('except');

        if ($only) {
            $allow = array_intersect($this->crud, explode(',', $only));
        } elseif ($except) {
            $allow = array_diff($this->crud, explode(',', $except));
        }

        $this->allow = $allow;

        return $this;
    }

    protected function getNames($string)
    {
        $array = array_filter(explode(',', $string));
        return array_map(function ($v) {
            $char = '@';
            if (strpos($v, $char) !== false) {
                $arr    = explode($char, $v);
                $arr[1] = Str::studly($arr[1]);
                $v      = join($char, $arr);
            } else {
                $v = Str::studly($v);
            }
            return $v;
        }, $array);
    }

    protected function formatNamespace($string)
    {
        if ($string && !in_array($string[mb_strlen($string) - 1], ['@', '/'])) {
            $string .= strpos($string, '@') !== false ? '/' : '@';
        }

        return $string;
    }
}
