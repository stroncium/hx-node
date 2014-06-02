package node;

@:native('process') @:publicFields @:final
extern class Process{
  static function on(event:String, fn:Dynamic):Void;
  static inline function onUncaughtException(fn:Dynamic->Void):Void
    on('uncaughtException', fn);
  static inline function onExit(fn:Void->Void):Void
    on('exit', fn);

  //Signal Events

  static var stdout(default,null):node.stream.WritableImpl;
  static var stderr(default,null):node.stream.WritableImpl;
  static var stdin(default,null):node.stream.ReadableImpl;
  static var argv(default, null):Array<String>;
  static var execPath(default, null):String;
  static var execArgv(default, null):String;
  static function abort():Void;
  static function chdir(path:String):Void;
  static function cwd():String;
  static var env(default, null):Dynamic;
  static function exit(?code:Int = 0):Void;

  static var gid(get, set):Int;
  static inline function get_gid():Int return getgid();
  static inline function set_gid(v:Int):Int{ setgid(v); return v;}
  static function getgid():Int;
  @:overload(function(gname:String):Void{})
  static function setgid(gid:Int):Void;

  static var uid(get, set):Int;
  static inline function get_uid():Int return getuid();
  static inline function set_uid(v:Int):Int{ setuid(v); return v;}
  static function getuid():Int;
  @:overload(function(uname:String):Void{})
  static function setuid(uid:Int):Void;

  static var groups(get, set):Array<Int>;
  static inline function get_groups():Array<Int> return getgroups();
  static inline function set_groups(v:Array<Int>):Array<Int>{ setgroups(v); return v;}
  static function getgroups():Array<Int>;
  static function setgroups(groups:Array<Int>):Void;

  static function initgroups(user:Dynamic, extraGroup:Dynamic):Void;

  static var version(default, null):String;
  static var versions(default, null):Dynamic<String>;
  static var config(default, null):Dynamic;

  static function kill(pid:Int, ?signal:String = 'SIGTERM'):Void;

  static var pid(default, null):Int;
  static var title:String;
  static var arch(default, null):String;
  static var platform(default, null):String;
  static function memoryUsage():{rss:Float, heapUsed:Float, heapTotal:Float};
  static function nextTick(fn:Dynamic):Void;
  static var maxTickDepth:Int;
  static function umask(?mask:Int):Int;
  static function uptime():Float;
  static function hrtime():Array<Float>;
}
