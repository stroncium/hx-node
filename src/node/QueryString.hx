package node;
@:final
extern class QueryString implements Node.Module<'querystring', ''>{
  public static function stringify(obj:Dynamic, ?sep:String, ?eq:String):String;
  public static function parse(str:String, ?sep:String, ?eq:String, ?options:{?maxKeys:Int}):Dynamic<String>;
  public static function escape(str:String):String;
  public static function unescape(str:String):String;
  public static function encode(str:String):String;
  public static function decode(str:String):String;
  public static function unescapeBuffer(buf:Buffer, ?decodeSpaces:Bool):Buffer;
}
