package node;
@:jsRequire('console')
extern class Console{
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
