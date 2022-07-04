<?php
/**
 * Created by PhpStorm.
 * User: Vito
 * Date: 2022/5/19
 * Time: 15:14
 */

namespace app\common;

use think\contract\Arrayable;
use think\contract\Jsonable;

class ArrayObject implements \ArrayAccess, Arrayable, Jsonable
{
    protected $data = [];

    public function __construct($data = [])
    {
        $this->data = $data;
    }

    public static function make($data = [])
    {
        return new static($data);
    }

    public function offsetExists($offset)
    {
        return isset($this->data[$offset]);
    }

    public function offsetGet($offset)
    {
        return $this->data[$offset] ?? null;
    }

    public function offsetSet($offset, $value)
    {
        $this->data[$offset] = $value;
    }

    public function offsetUnset($offset)
    {
        unset($this->data[$offset]);
    }

    public function toArray(): array
    {
        return $this->data;
    }

    public function toJson(int $options = JSON_UNESCAPED_UNICODE): string
    {
        return json_encode($this->toArray(), $options);
    }

    public function __toString()
    {
        return $this->toJson();
    }

    /**
     * 合并数组
     * @param mixed ...$array
     * @return $this
     */
    public function merge(...$array)
    {
        $this->data = array_merge($this->data, ...$array);

        return $this;
    }
}