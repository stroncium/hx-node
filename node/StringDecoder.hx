package node;
extern class StringDecoder{
  static function __init__():Void untyped StringDecoder = Node.require('string_decoder').StringDecoder;
  public function new(?enc:String):Void;
  public function write(buf:Buffer):String;
  public function end():String;
}
