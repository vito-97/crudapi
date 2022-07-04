<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/3/16
 * Time: 9:32
 */

namespace app\service;


use app\common\ErrorCode;
use app\exception\ErrorException;
use app\exception\InvalidArgumentException;

class FileSystemService
{
    protected $file = '';

    public function __construct($file = '')
    {
        $this->file = $file;
    }

    /**
     * 获取指定文件夹里的所有文件
     * @param string $dir
     * @return array|false
     * @throws ErrorException
     */
    public function getDirFiles($dir = '')
    {
        $dir = $dir ?: $this->file;

        if (!$dir) {
            throw new ErrorException(ErrorCode::NOT_REALLY_FOLDER);
        }

        if (!is_dir($dir)) {
            throw new ErrorException(ErrorCode::NOT_REALLY_FOLDER);
        }

        $files = $this->scanDir($dir);

        return $files;
    }

    /**
     * 遍历目录获取所有文件
     * @param $dir
     * @return array|false
     */
    protected function scanDir($dir)
    {
        $files = scandir($dir);

        if (!$files) return [];

        $files = array_filter($files, function ($item) {
            return !in_array($item, ['.', '..']);
        });

        $data = [];

        foreach ($files as $file) {
            $fullFile = $dir . DIRECTORY_SEPARATOR . $file;
            if (is_dir($fullFile)) {
                $data = array_merge($data, $this->scanDir($fullFile));
            } else {
                $data[] = $fullFile;
            }
        }

        return $data;
    }
}