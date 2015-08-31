package node;


private typedef InspectOpts = {
  ?showHidden:Bool,
  ?depth:Int,
  ?colors:Bool,
  ?customInspect:Bool,
};

@:final
@:jsRequire('util')
extern class Util{
  public static var format(default, null):Dynamic;
  public static function debug(s:String):Void;
  public static function error(a1:Dynamic, ?a2:Dynamic, ?a3:Dynamic, ?a4:Dynamic, ?a5:Dynamic):Void;
  public static function puts(a1:Dynamic, ?a2:Dynamic, ?a3:Dynamic, ?a4:Dynamic, ?a5:Dynamic):Void;
  public static function print(a1:Dynamic, ?a2:Dynamic, ?a3:Dynamic, ?a4:Dynamic, ?a5:Dynamic):Void;
  public static function log(s:String):Void;
  public static function inspect(obj:Dynamic, ?opts:InspectOpts):String;

  public static var inspectColors(get,null):Dynamic;
  public static var inspectStyles(get,null):Dynamic;
  static inline function get_inspectColors():Dynamic return untyped inspect.colors;
  static inline function get_inspectStyles():Dynamic return untyped inspect.styles;

  public static function isArray(o:Dynamic):Bool;
  public static function isRegExp(o:Dynamic):Bool;
  public static function isDate(o:Dynamic):Bool;
  public static function isError(o:Dynamic):Bool;
  public static function inherits(constructor:Dynamic, superConstructor:Dynamic):Void;
}
