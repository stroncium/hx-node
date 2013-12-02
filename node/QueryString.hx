package node;
extern class QueryString{
  static function __init__():Void untyped QueryString = Node.require('querystring');

  public static function stringify(obj:Dynamic, ?sep:String, ?eq:String):String;
  public static function parse(str:String, ?sep:String, ?eq:String, ?options:{?maxKeys:Int}):Dynamic;
  public static var escape:String->String;
  public static var unescape:String->String;
}
