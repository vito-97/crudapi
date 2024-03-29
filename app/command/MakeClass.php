<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/19
 * Time: 11:00
 */

namespace app\command;

use think\console\command\Make;
use think\console\Input;
use think\console\input\Argument;
use think\console\input\Option;
use think\console\Output;
use think\helper\Str;

/**
 * 生成所需要的类库
 * 只有控制器才需要设置应用目录
 * php think make:class index@Admin --type logic|controller|model|validate
 * Class Business
 * @package crmeb\command
 */
class MakeClass extends Make
{
    protected $type = "";

    //所有类型
    protected $types = [
        'logic', 'controller', 'model', 'validate',
    ];

    //存放在公共模块的类型
    protected $commonModuleType = [];

    //指定类型的后缀
    protected $suffix = [
        'logic'    => 'Logic',
        'validate' => 'Validate',
    ];

    protected $basename;

    protected function configure()
    {
        parent::configure();
        $this->setName('make:class')
            ->addOption('type', null, Option::VALUE_REQUIRED, '需要生成的文件类型' . join('|', $this->types))
            ->addOption('namespace', null, Option::VALUE_OPTIONAL, '命名空间')
            ->setDescription('创建新的类');
    }

    protected function execute(Input $input, Output $output)
    {
        $names     = $this->getNames($input->getArgument('name'));
        $namespace = $this->formatNamespace($input->getOption('namespace'));

        foreach ($names as $name) {
            $input->setArgument('name', $namespace . $name);
            parent::execute($input, $output);
        }
    }

    protected function getStub(): string
    {
        $type = $this->getClassType();

        return __DIR__ . DIRECTORY_SEPARATOR . 'stubs' . DIRECTORY_SEPARATOR . $type . '.stub';
    }

    protected function getClassName(string $name): string
    {
        $type = $this->getClassType();

        $suffix = $this->suffix[$type] ?? '';

        $className = parent::getClassName($name);

        $this->basename = basename(str_replace('\\', '/', $className));

        return $className . $suffix;
    }

    protected function buildClass(string $name)
    {
        $content = parent::buildClass($name);

        [, $app] = explode('\\', $name);

        return str_replace(['{%app%}', '{%name%}'], [$app, $this->basename], $content);
    }

    protected function getNamespace(string $app): string
    {
        $type = $this->getClassType();

        $module = '';

        if (!$app && in_array($type, $this->commonModuleType)) {
            $module = 'common';
        }

        return parent::getNamespace($app) . '\\' . ($module ? $module . '\\' : '') . $type;
    }

    /**
     * 获取类的类型
     * @return string
     */
    protected function getClassType()
    {
        $type = strtolower($this->input->getOption('type'));

        if (empty($type)) {
            throw new \InvalidArgumentException(sprintf('The type must be in %s.', join(',', $this->types)));
        }

        if (!in_array($type, $this->types)) {
            throw new \InvalidArgumentException(sprintf('The type "%s" does not in %s.', $type, join(',', $this->types)));
        }

        return $type;
    }

    protected function getNames($string)
    {
        $array = array_filter(explode(',', $string));
        return array_map(function ($v) {
            return Str::studly($v);
        }, $array);
    }

    protected function formatNamespace($string)
    {
        if ($string) {
            $string = rtrim($string, '/') . '/';
        }

        return $string;
    }
}
