<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/11
 * Time: 16:50
 */

namespace app\command;


use app\common\ErrorCode;
use app\common\Message;
use think\console\Command;
use think\console\Input;
use think\console\input\Option;
use think\console\Output;
use think\facade\App;
use think\facade\Lang;

class MakeLang extends Command
{
    protected $langPath;

    protected $useClass = [];

    public function __construct()
    {
        parent::__construct();
        $this->langPath = App::getBasePath() . '/lang/';
    }

    protected function configure()
    {
        $this->setName('lang')->addArgument('lang', Option::VALUE_OPTIONAL)
            ->setDescription('自动生成关联的多语言包');
    }

    protected function execute(Input $input, Output $output)
    {
        $lang = $input->getArgument('lang');

        $langName = $this->getLangName($lang);

        $message = $this->getLang();

        //语言包原始数据
        $langRawData = [];
        //语言包数据
        $langData = [];

        foreach ($langName as $name) {

            $langRawData[$name] = $this->getLangDataRaw($name);
            $langData[$name]    = $this->getLangNewData($name, $message, $langRawData[$name]);

            $file = $this->langPath . $name . '.php';

            $string = $this->buildLang($langData[$name]);

            file_put_contents($file, $string);
        }

        $output->writeln('ok');
    }

    /**
     * 获取语言包原始数据
     * @param $name
     * @return false|string
     */
    protected function getLangDataRaw($name)
    {
        $file = $this->langPath . $name . '.php';
        $data = '';

        if (file_exists($file)) {
            $data = file_get_contents($file);
        }

        return $data;
    }

    /**
     * 获取语言包最新数据
     * @param $name
     * @param $message
     * @param $rawData
     * @return array
     */
    protected function getLangNewData($name, $message, $rawData)
    {
        $data = [];

        Lang::setLangSet($name);

        $lang = Lang::get();

        foreach ($message as $key => $value) {
            if (strpos($rawData, $key) === false) {
                $data[$key] = $value;
            } else {
                $data[$key] = Lang::get(strpos($key, '::') === false ? $key : $value);
            }
        }

        Lang::setLangSet(Lang::defaultLangSet());

        return $data;
    }

    /**
     * 生成语言文本数据
     * @param $data
     * @return string
     */
    protected function buildLang($data)
    {
        $array   = ['<?php'];
        $day     = date('Y/m/d');
        $time    = date('H:i');
        $array[] = "/**
 * Created by Command.
 * User: Vito
 * Date: {$day}
 * Time: {$time}
 */";

        foreach ($this->useClass as $name) {
            $array[] = 'use ' . $name . ';';
        }

        $array[] = '';
        $array[] = 'return [';

        foreach ($data as $key => $value) {
            $k = $key;
            $v = $value;
            //不是类常量
            if (strpos($k, '::') === false) {
                $k = '\'' . addslashes($k) . '\'';
            }
            if (strpos($v, '::') === false) {
                $v = '\'' . addslashes($v) . '\'';
            }

            $array[] = "\t{$k} => $v,";
        }

        $array[] = '];';
        $array[] = '';

        return join("\r\n", $array);
    }

    /**
     * 获取语言包文件名
     * @param $lang
     * @return array|string[]
     */
    protected function getLangName($lang)
    {
        if (!$lang) {
            $lang      = [];
            $langFiles = glob($this->langPath . '*.php');

            if ($langFiles) {
                foreach ($langFiles as $file) {
                    $lang[] = basename($file, '.php');
                }
            }
        } else {
            $lang = array_filter(array_map('trim', is_array($lang) ? $lang : explode(',', $lang)));
        }

        if (empty($lang)) {
            $lang = ['zh-cn'];
        }

        return $lang;
    }

    /**
     * 获取需要添加的语言包数据
     * @return array
     */
    protected function getLang()
    {
        return array_merge($this->getErrorCode(), $this->getMessage(), $this->getValidate());
    }

    /**
     * 获取错误码语言包
     * @return array
     */
    protected function getErrorCode()
    {
        $this->useClass[] = ErrorCode::class;
        $data             = [];
        $code             = [];

        $constants = $this->getClassConstants(ErrorCode::class);

        foreach ($constants as $name => $value) {
            if (isset($code[$value[0]])) {
                $this->output->writeln("常量{$name}的错误码已被{$code[$value[0]]}设置");
                die;
            }
            $code[$value[0]]               = $name;
            $data["ErrorCode::{$name}[1]"] = $value[1];
        }

        return $data;
    }

    /**
     * 获取消息语言包
     * @return array
     */
    protected function getMessage()
    {
        $this->useClass[] = Message::class;

        $constants = $this->getClassConstants(Message::class);

        $data = [];

        foreach ($constants as $name => $value) {
            if (is_array($value)) {
                foreach ($value as $k => $v) {
                    $data["Message::{$name}['{$k}']"] = $v;
                }
            } else {
                $data["Message::{$name}"] = $value;
            }
        }

        return $data;
    }

    protected function getValidate()
    {
        $data      = [];
        $path      = App::getBasePath() . '/validate/*.php';
        $exclude   = ['BaseValidate'];
        $files     = glob($path);
        $namespace = 'app\validate\\';
        foreach ($files as $file) {
            $name = basename($file, '.php');
            if (!in_array($name, $exclude)) {
                $className = $namespace . $name;

                $class = new \ReflectionClass($className);

                $properties = $class->getDefaultProperties();

                $rule      = $properties['rule'];
                $field     = $properties['field'];
                $langGroup = $properties['langFieldGroup'];

                foreach ($rule as $key => $val) {
                    if (strpos($key, '|')) {
                        [$f, $alias] = explode('|', $key);
                    } else {
                        $alias = $f = $key;
                    }

                    $k = $alias;

                    if (strpos($alias, $langGroup . '.') === false) {
                        $k = $langGroup . '.' . $alias;
                    }

                    $data[$k] = $alias;
                }

                foreach ($field as $key => $val) {
                    $k = $val;
                    if (strpos($val, $langGroup . '.') === false) {
                        $k = $langGroup . '.' . $val;
                    }

                    $data[$k] = $val;
                }
            }
        }

        return $data;
    }

    /**
     * 获取类的常量
     * @param $className
     * @return array
     */
    protected function getClassConstants($className)
    {
        $class = new \ReflectionClass($className);

        $constants = $class->getConstants();

        return $constants;
    }
}
