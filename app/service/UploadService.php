<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/19
 * Time: 16:46
 */

namespace app\service;

use think\exception\ValidateException;
use think\facade\Filesystem;
use think\facade\Request;
use think\file\UploadedFile;
use think\filesystem\driver\Local;

class UploadService
{
    //磁盘
    const STORAGE = 'public';
    //图片类型
    const IMAGE_FILE_EXT = ['jpg', 'jpeg', 'png', 'gif',];
    //文件类型
    const FILE_EXT = ['txt', 'mp4', 'mp3', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'zip', 'rar', 'pdf',];

    //允许上传的mime类型
    const MIME = [
        'doc'  => 'application/msword',
        'word' => 'application/msword',
        'xlsx' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        'xltx' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.template',
        'potx' => 'application/vnd.openxmlformats-officedocument.presentationml.template',
        'ppsx' => 'application/vnd.openxmlformats-officedocument.presentationml.slideshow',
        'pptx' => 'application/vnd.openxmlformats-officedocument.presentationml.presentation',
        'sldx' => 'application/vnd.openxmlformats-officedocument.presentationml.slide',
        'docx' => 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        'dotx' => 'application/vnd.openxmlformats-officedocument.wordprocessingml.template',
        'xlam' => 'application/vnd.ms-excel.addin.macroEnabled.12',
        'xlsb' => 'application/vnd.ms-excel.sheet.binary.macroEnabled.12',
        'pdf'  => 'application/pdf',
        'xls'  => 'application/vnd.ms-excel',
        'ppt'  => 'application/vnd.ms-powerpoint',
        'tar'  => 'application/x-tar',
        'tgz'  => 'application/x-tar',
        'zip'  => 'application/zip',
        'mp3'  => 'audio/mpeg',
        'ogg'  => 'audio/ogg',
        'wav'  => 'audio/wav',
        'gif'  => 'image/gif',
        'jpeg' => 'image/jpeg',
        'jpe'  => 'image/jpeg',
        'jpg'  => 'image/jpeg',
        'png'  => 'image/png',
        'tiff' => 'image/tiff',
        'tif'  => 'image/tiff',
        'webp' => 'image/webp',
        'log'  => 'text/plain',
        'text' => 'text/plain',
        'txt'  => 'text/plain',
        'mp4'  => 'video/mp4',
    ];

    /**
     * @var Local 磁盘
     */
    protected static $disk;

    /**
     * 获取磁盘
     * @return \think\filesystem\Driver|Local
     */
    public static function disk()
    {
        if (!self::$disk) {
            self::$disk = Filesystem::disk(self::STORAGE);
        }

        return self::$disk;
    }

    /**
     * 上传图片
     * @param array $files
     * @return array
     * @throws \app\exception\ValidateException
     */
    public static function image($files = [])
    {
        return self::file($files, self::IMAGE_FILE_EXT);
    }

    /**
     * 上传文件
     * @param array $files
     * @param array $exts
     * @return array
     * @throws \app\exception\ValidateException
     */
    public static function file($files = [], $exts = [])
    {
        $result = [];
        $disk   = self::disk();
        $files  = $files ?: Request::file();

        if (empty($files)) {
            return $result;
        }

        $rules = [];
        foreach ($files as $key => $file) {
            $rules[$key] = ['fileExt' => $exts ?: array_merge(self::IMAGE_FILE_EXT, self::FILE_EXT), 'fileMime' => array_values(self::MIME)];
        }

        try {
            validate($rules)->check($files);
        } catch (ValidateException $e) {
            throw new \app\exception\ValidateException($e->getMessage());
        }

        foreach ($files as $file) {
            /**
             * @var $file UploadedFile
             */
            $savename = str_replace('\\', '/', $disk->putFile('attachment', $file, 'md5'));
            $path     = $disk->path($savename);

            [$width, $height] = self::getImageSize($path);


            $result[] = [
                'name'     => $file->getOriginalName(),
                'savename' => $savename,
                'path'     => $path,
                'url'      => $disk->url($savename),
                'mime'     => $file->getMime(),
                'size'     => $file->getSize(),
                'md5'      => $file->md5(),
                'sha1'     => $file->sha1(),
                'type'     => $file->extension(),
                'width'    => $width,
                'height'   => $height,
                'module'   => app()->http->getName()
            ];
        }

        return $result;
    }

    /**
     * 获取图片宽高
     * @param $path
     * @return array
     */
    protected static function getImageSize($path)
    {
        $width = $height = 0;
        $ext   = pathinfo($path, PATHINFO_EXTENSION);

        //图片类型
        if (in_array($ext, self::IMAGE_FILE_EXT)) {

            $info = getimagesize($path);

            if ($info) {
                $width  = $info[0];
                $height = $info[1];
            }
        }

        return [$width, $height];
    }
}
