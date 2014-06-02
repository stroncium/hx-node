package node;

extern class Assert{
  public static function fail<T>(actual:T, expected:T, message:String, operator:String):Void;
  public static function ok(value:Bool, ?msg:String):Void;
  public static function equal<T>(actual:T, expected:T, ?msg:String):Void;
  public static function notEqual<T>(actual:T, expected:T, ?msg:String):Void;
  public static function deepEqual<T>(actual:T, expected:T, ?msg:String):Void;
  public static function notDeepEqual<T>(actual:T, expected:T, ?msg:String):Void;
  public static function strictEqual<T>(actual:T, expected:T, ?msg:String):Void;
  public static function notStrictEqual<T>(actual:T, expected:T, ?msg:String):Void;
  public static function throws(block:Void->Void, ?error:Dynamic, ?msg:String):Void;
  public static function doesNotThrow(block:Void->Void, ?msg:String):Void;
  public static function ifError(value:Bool):Void;

  static function __init__():Void untyped Assert = Node.require('assert');
}
