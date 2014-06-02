package node;

extern class ChildProcess extends EventEmitter{
  // Event 'exit'
  // Event 'close'
  // Event 'disconnect'
  // Event 'message'
  public var stdin(default,null):node.stream.WritableImpl;
  public var stdout(default,null):node.stream.ReadableImpl;
  public var stderr(default,null):node.stream.ReadableImpl;
  public var pid(default,null):Int;

  public function kill(?signal:String):Void;
  public function send(message:Dynamic, ?sendHandle:Bool):Void;
  public function disconnect():Void;

  public static function spawn(cmd:String, args:Array<String>, options:SpawnOptions):ChildProcess;
  public static function exec(cmd:String, options:ExecOptions, cb:Dynamic->Buffer->Buffer->Void):ChildProcess;
  public static function execFile(cmd:String, options:ExecOptions, cb:Dynamic->Buffer->Buffer->Void):ChildProcess;
  public static function fork(path:String, args:Array<String>, options:ForkOptions):ChildProcess;

  static function __init__():Void untyped ChildProcess = Node.require('child_process');
}

private typedef ForkOptions = {
  ?cwd:String,
  ?env:Dynamic,
  ?encoding:String,
  ?silent:Bool,
};

private typedef SpawnOptions = {
  ?cwd:String,
  ?stdio:Array<Dynamic>,
  ?env:Dynamic,
  ?detached:Bool,
  ?uid:Int,
  ?gid:Int,
};

private typedef ExecOptions = {
  ?cwd:String,
  ?stdio:Array<Dynamic>,
  ?env:Dynamic,
  ?encoding:String,
  ?timeout:Int,
  ?maxBuffer:Int,
  ?killSIgnal:String,
};
