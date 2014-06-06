package node;

@:event('uncaughtException', (error:Dynamic))
@:event('exit')
@:event('SIGUSR1')
@:event('SIGTERM')
@:event('SIGINT')
@:event('SIGPIPE')
@:event('SIGHUP')
@:event('SIGBREAK')
@:event('SIGWINCH')
@:event('SIGKILL')
@:event('SIGSTOP')
@:final
extern class Process{
  public var stdout(default,null):node.stream.Writable;
  public var stderr(default,null):node.stream.Writable;
  public var stdin(default,null):node.stream.Readable;
  public var argv(default, null):Array<String>;
  public var execPath(default, null):String;
  public var execArgv(default, null):String;
  public function abort():Void;
  public function chdir(path:String):Void;
  public function cwd():String;
  public var env(default, null):Dynamic;
  public function exit(?code:Int = 0):Void;

  public var gid(get, set):Int;
  public inline function get_gid():Int return getgid();
  public inline function set_gid(v:Int):Int{ setgid(v); return v;}
  public function getgid():Int;
  
    @:overload(function(gname:String):Void{})
  public function setgid(gid:Int):Void;

  public var uid(get, set):Int;
  public inline function get_uid():Int return getuid();
  public inline function set_uid(v:Int):Int{ setuid(v); return v;}
  public function getuid():Int;
  
    @:overload(function(uname:String):Void{})
  public function setuid(uid:Int):Void;

  public var groups(get, set):Array<Int>;
  public inline function get_groups():Array<Int> return getgroups();
  public inline function set_groups(v:Array<Int>):Array<Int>{ setgroups(v); return v;}
  public function getgroups():Array<Int>;
  public function setgroups(groups:Array<Int>):Void;

  public function initgroups(user:Dynamic, extraGroup:Dynamic):Void;

  public var version(default, null):String;
  public var versions(default, null):Dynamic<String>;
  public var config(default, null):Dynamic;

  public function kill(pid:Int, ?signal:String = 'SIGTERM'):Void;

  public var pid(default, null):Int;
  public var title:String;
  public var arch(default, null):String;
  public var platform(default, null):String;
  public function memoryUsage():{rss:Float, heapUsed:Float, heapTotal:Float};
  public function nextTick(fn:Dynamic):Void;
  public var maxTickDepth:Int;
  public function umask(?mask:Int):Int;
  public function uptime():Float;
  public function hrtime():Array<Float>;
}
