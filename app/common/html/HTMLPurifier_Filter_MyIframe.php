<?php
/**
 * Created by PhpStorm.
 * User: 19248
 * Date: 2022/11/26
 * Time: 16:54
 */

namespace app\common\html;

class HTMLPurifier_Filter_MyIframe extends \HTMLPurifier_Filter
{
    public $name = 'MyIframe';

    public function preFilter($html, $config, $context)
    {
        return preg_replace(['/<iframe/', '/<\/iframe>/'], ['<img class="MyIframe"', '</img>'], $html);
    }

    public function postFilter($html, $config, $context)
    {
        $post_regex = '#<img class="MyIframe" ([\s\S]*?)/>#';

        return preg_replace($post_regex, '<iframe $1></iframe>', $html);
    }
}
