package node;

private abstract Handle(Void){}

@:enum
private abstract AddressType(Dynamic) #if !debug from String from Int #end{
  inline var TCP4 = 4;
  inline var TCP6 = 6;
  inline var UnixDomainSocket = -1;
  inline var UDP4 = 'udp4';
  inline var UDP6 = 'udp6';

  #if debug
    @:from public static function fromString(v:String):AddressType{
      if(v != 'udp4' && v != 'udp6') throw 'Unknown address type: $v';
      return untyped v;
    }

    @:from public static function fromInt(v:Int):AddressType{
      if(v != 4 && v != 6 && v != -1) throw 'Unknown address type: $v';
      return untyped v;
    }
  #end
}

private typedef Address = {
  address:String,
  port:Int,
  addressType:AddressType,
};

private typedef Signal = String;

@:event('message', (msg:Dynamic))
@:event('online')
@:event('listening', (address:Address))
@:event('disconnect')
@:event('exit', (code:Int), (signal:Signal))
@:event('error')
extern class Worker extends EventEmitter implements Node.ModuleSub<'cluster', '', 'Worker'>{
  // static function __init__():Void Node.classify(Worker, EventEmitter);

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

@:event('fork', (worker:Worker))
@:event('online', (worker:Worker))
@:event('listening', (worker:Worker), (address:Address))
@:event('disconnect', (worker:Worker))
@:event('exit', (worker:Worker), (code:Int), (signal:Signal))
@:event('setup')
extern class Cluster extends EventEmitter implements Node.Module<'cluster', ''>{
  // static function __init__():Void Node.classify(Cluster, EventEmitter);

  public static var settings(default,null):ClusterSettings;
  public static var isMaster(default,null):Bool;
  public static var isWorker(default,null):Bool;

  public static function setupMaster(?settings:ClusterSettings):Void;
  public static function fork(?env:Dynamic<String>):Worker;
  public static function disconnect(?cb:Void->Void):Void;
  public static var worker(default,null):Worker;
  public static var workers(default,null):Dynamic<Worker>;
}
