<?php
/**
 * Created by Command.
 * User: Vito
 */

declare (strict_types=1);

namespace app\model;

use app\common\Util;
use app\model\traits\AdminTrait;
use app\model\traits\AgentTrait;
use app\model\traits\SiteScopeTrait;
use app\model\traits\UserTrait;
use think\db\Query;

class Attachment extends BaseModel
{
    use AdminTrait, UserTrait, AgentTrait;

    use SiteScopeTrait;

    protected $append = ['category_desc', 'storage_desc', 'link'];

    protected $scene = [
        'detail' => [
            'append' => ['category_desc', 'storage_desc', 'link'],
        ],
    ];

    const IMAGE_CATEGORY = 'image';
    const VIDEO_CATEGORY = 'video';
    const MP3_CATEGORY = 'mp3';
    const DOC_CATEGORY = 'doc';
    const XLS_CATEGORY = 'xls';
    const PPT_CATEGORY = 'ppt';
    const ZIP_CATEGORY = 'zip';
    const PDF_CATEGORY = 'pdf';
    const UNKNOWN_CATEGORY = 'un';

    /**
     * 类型对应的后缀
     */
    const TYPE_EXT = [
        self::IMAGE_CATEGORY => ['jpg', 'jpeg', 'png', 'gif'],
        self::VIDEO_CATEGORY => ['mp4'],
        self::MP3_CATEGORY   => ['mp3'],
        self::DOC_CATEGORY   => ['doc', 'docx'],
        self::XLS_CATEGORY   => ['xls', 'xlsx'],
        self::PPT_CATEGORY   => ['ppt'],
        self::PDF_CATEGORY   => ['pdf'],
        self::ZIP_CATEGORY   => ['zip', 'rar'],
    ];

    protected $categoryEnum = [
        self::IMAGE_CATEGORY   => '图片',
        self::VIDEO_CATEGORY   => '视频',
        self::MP3_CATEGORY     => '音频',
        self::DOC_CATEGORY     => '文档',
        self::XLS_CATEGORY     => '图表',
        self::PPT_CATEGORY     => 'PPT',
        self::PDF_CATEGORY     => 'PDF',
        self::ZIP_CATEGORY     => '压缩包',
        self::UNKNOWN_CATEGORY => '未归类',
    ];

    const PUBLIC_STORAGE = 'public';
    protected $storageEnum = [
        self::PUBLIC_STORAGE => '本地',
    ];

    /**
     * 搜索列表时的模糊搜索条件
     * @param Query $query
     * @param $value
     * @return Query
     */
    public function searchIndexAttr(Query $query, $value)
    {
        return $query->where('name|url', 'like', '%' . $value . '%');
    }

    protected function setCategoryAttr($value, $data = [])
    {
        if ($value === self::UNKNOWN_CATEGORY && isset($data['type'])) {
            $value = self::getCategoryByExt($data['type']);
        }

        return $value;
    }

    /**
     * 通过后缀名获取分类
     * @param $ext
     * @return string
     */
    public static function getCategoryByExt($ext)
    {
        foreach (self::TYPE_EXT as $category => $exts) {
            if (in_array($ext, $exts)) {
                return $category;
            }
        }

        return self::UNKNOWN_CATEGORY;
    }

    protected function getCategoryDescAttr($value, $data)
    {
        return $this->getEnumDesc('category', $data);
    }

    protected function getStorageDescAttr($value, $data)
    {
        return $this->getEnumDesc('storage', $data);
    }

    protected function getLinkAttr($value, $data)
    {
        if (isset($data['url'])) {
            return Util::link($data['url']);
        }

        return $value;
    }

    protected function setNameAttr($value)
    {
        return mb_substr($value, 0, 100);
    }
}
