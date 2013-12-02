package node;
extern class Console{
  static function __init__():Void untyped Console = Node.js('console');

  public static var log(default,null):Dynamic;
  public static var info(default,null):Dynamic;
  public static var error(default,null):Dynamic;
  public static var warn(default,null):Dynamic;
  public static function dir(obj:Dynamic):Void;
  public static function time(label:String):Void;
  public static function timeEnd(label:String):Void;
  public static function trace(label:String):Void;
  public static function assert(expression:Bool, ?message:Dynamic):Void;
}
