package node;

private extern class Handle{}
extern class Worker{
  // Event: 'message'
  // Event: 'online'
  // Event: 'listening'
  // Event: 'disconnect'
  // Event: 'exit'
  // Event: 'error'
  public var id:String;
  public var process:ChildProcess;
  public var suicide:Null<Bool>;
  public function send(message:Dynamic, handle:Handle):Void;
  public function kill(?signal:String):Void;
  public function disconnect():Void;
}

private typedef ClusterSettings = {
  exec:String,
  args:Array<String>,
  silent:Bool,
};

extern class Cluster extends EventEmitter{
  static function __init__():Void untyped Cluster = Node.require('cluster');

  // Event: 'fork'
  // Event: 'online'
  // Event: 'listening'
  // Event: 'disconnect'
  // Event: 'exit'
  // Event: 'setup'


  public static var settings(default,null):ClusterSettings;
  public static var isMaster(default,null):Bool;
  public static var isWorker(default,null):Bool;

  public static function setupMaster(?settings:ClusterSettings):Void;
  public static function fork(?env:Dynamic<String>):Worker;
  public static function disconnect(?cb:Void->Void):Void;
  public static var worker(default,null):Worker;
  public static var workers(default,null):Dynamic<Worker>;
}
