package node;
@:jsRequire('querystring')
extern class QueryString{
  public static function stringify(obj:Dynamic, ?sep:String, ?eq:String):String;
  public static function parse(str:String, ?sep:String, ?eq:String, ?options:{?maxKeys:Int}):js.Object;
  public static function escape(str:String):String;
  public static function unescape(str:String):String;
  public static function encode(str:String):String;
  public static function decode(str:String):String;
  public static function unescapeBuffer(buf:Buffer, ?decodeSpaces:Bool):Buffer;
}
