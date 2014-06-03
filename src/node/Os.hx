package node;

@:final
extern class Os implements Node.Module<'os', ''>{
  public static function tmpdir():String;
  public static function endianness():String; // 'BE' || 'LE'
  public static function hostname():String;
  public static function type():String;
  public static function platform():String;
  public static function arch():String;
  public static function release():String;
  public static function uptime():Float;
  public static function loadavg():Array<Float>;
  public static function totalmem():Float;
  public static function freemem():Float;
  public static function cpus():Array<Dynamic>;
  public static function networkInterfaces():Dynamic<Dynamic>;
  public static var EOL(default, null):String;
}


