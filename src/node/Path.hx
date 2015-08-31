package node;
@:final
@:jsRequire('path')
extern class Path{
  public static function normalize(p:String):String;
  public static function join(p1:String, p2:String, ?p3:String, ?p4:String, ?p5:String):String;
  public static function resolve(p1:String, p2:String, ?p3:String, ?p4:String, ?p5:String):String;
  public static function relative(from:String, to:String):String;
  public static function dirname(p:String):String;
  public static function basename(p:String, ?ext:String):String;
  public static function extname(p:String):String;
  public static var sep(default,null):String;
  public static var delimiter(default,null):String;
}
