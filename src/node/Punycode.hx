package node;

@:native('node.Punycode.Ucs2')
private extern class Ucs2{
  public static function decode(string:String):Array<Int>;
  public static function encode(codePoints:Array<Int>):String;
}

@:jsRequire('punycode')
extern class Punycode{
  public static function decode(s:String):String;
  public static function encode(s:String):String;
  public static function toUnicode(domain:String):String;
  public static function toASCII(domain:String):String;
  public static var ucs2(default,null):Ucs2;
  public static var version(default, null):String;
}
