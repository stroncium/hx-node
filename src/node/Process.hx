package node;

@:final
extern class Process{
  public static function __init__():Void{
    untyped Process = Node.js('process');
  }
  public static function on(event:String, fn:Dynamic):Void;
  public static inline function onUncaughtException(fn:Dynamic->Void):Void on('uncaughtException', fn);
  static inline function onExit(fn:Void->Void):Void on('exit', fn);

  //Signal Events TODO

  public static var stdout(default,null):node.stream.WritableImpl;
  public static var stderr(default,null):node.stream.WritableImpl;
  public static var stdin(default,null):node.stream.ReadableImpl;
  public static var argv(default, null):Array<String>;
  public static var execPath(default, null):String;
  public static var execArgv(default, null):String;
  public static function abort():Void;
  public static function chdir(path:String):Void;
  public static function cwd():String;
  public static var env(default, null):Dynamic;
  public static function exit(?code:Int = 0):Void;

  public static var gid(get, set):Int;
  public static inline function get_gid():Int return getgid();
  public static inline function set_gid(v:Int):Int{ setgid(v); return v;}
  public static function getgid():Int;
  
    @:overload(function(gname:String):Void{})
  public static function setgid(gid:Int):Void;

  public static var uid(get, set):Int;
  public static inline function get_uid():Int return getuid();
  public static inline function set_uid(v:Int):Int{ setuid(v); return v;}
  public static function getuid():Int;
  
    @:overload(function(uname:String):Void{})
  public static function setuid(uid:Int):Void;

  public static var groups(get, set):Array<Int>;
  public static inline function get_groups():Array<Int> return getgroups();
  public static inline function set_groups(v:Array<Int>):Array<Int>{ setgroups(v); return v;}
  public static function getgroups():Array<Int>;
  public static function setgroups(groups:Array<Int>):Void;

  public static function initgroups(user:Dynamic, extraGroup:Dynamic):Void;

  public static var version(default, null):String;
  public static var versions(default, null):Dynamic<String>;
  public static var config(default, null):Dynamic;

  public static function kill(pid:Int, ?signal:String = 'SIGTERM'):Void;

  public static var pid(default, null):Int;
  public static var title:String;
  public static var arch(default, null):String;
  public static var platform(default, null):String;
  public static function memoryUsage():{rss:Float, heapUsed:Float, heapTotal:Float};
  public static function nextTick(fn:Dynamic):Void;
  public static var maxTickDepth:Int;
  public static function umask(?mask:Int):Int;
  public static function uptime():Float;
  public static function hrtime():Array<Float>;
}
