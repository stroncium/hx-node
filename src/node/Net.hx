
package node;
import node.stream.DuplexImpl;
@:jsRequire('net')
extern class Net{
  public static function createServer(?opts:{?allowHalfOpen:Bool}, ?listener:Socket->Void):NetServer;

    @:overload(function (path:String, ?listener:Void->Void):Socket{})
    @:overload(function (opts:{port:Int, ?host:String, ?localAddress:String}, ?listener:Void->Void):Socket{})
  public static function connect(port:Int, host:String, ?listener:Void->Void):Socket;

  public static function isIP(str:String):Bool;
  public static function isIPv4(str:String):Bool;
  public static function isIPv6(str:String):Bool;
}

private typedef Address = {
  port:Int,
  family:String,
  address:String,
};

private abstract Handle(Void){}

@:event('listening')
@:event('connection', (socket:Socket))
@:event('close')
@:event('error', (error:Dynamic))
@:jsRequire('net', 'Server')
extern class NetServer extends EventEmitter{
  // static function __init__():Void Node.classify(NetServer, EventEmitter);

    @:overload(function (path:String, ?cb:Void->Void):Void{})
    @:overload(function (handle:Handle, ?cb:Void->Void):Void{})
    @:overload(function (handle:{fd:Fs.FileDescriptor}, ?cb:Void->Void):Void{})
  public function listen(port:Int, ?host:String, ?backlog:Int, ?cb:Void->Void):Void;
  public function close(?cb:Void->Void):Void;
  public function address():Address;
  public function unref():Void;
  public function ref():Void;
  public function getConnections(cb:Dynamic->Int->Void):Void;
  public var maxConnections:Int;
  // public var connections //deprecated
}


@:event('connect')
@:event('data', (buf:Buffer))
@:event('end')
@:event('timeout')
@:event('drain')
@:event('error', (error:Dynamic))
@:event('close', (hadError:Bool))
@:jsRequire('net', 'Socket')
extern class Socket extends DuplexImpl{
  // static function __init__():Void Node.classify(Socket, DuplexImpl);

  public function new(?opts:{fd:Fs.FileDescriptor, type:String, ?allowHalfOpen:Bool}):Void;
  @:overload(function (path:String, ?listener:Void->Void):Socket{})
  public function connect(port:Int, host:String, ?listener:Void->Void):Socket;

  public var bufferSize:Int;
  public function setTimeout(timeout:Int, ?cb:Void->Void):Void;
  public function setNoDelay(?noDelay:Bool):Void;
  public function setKeepAlive(?enable:Bool, ?initialDelay:Int):Void;
  public function address():Address;
  public function unref():Void;
  public function ref():Void;
  public var remoteAddress(default,null):String;
  public var remotePort(default,null):Int;
  public var localAddress(default,null):String;
  public var localPort(default,null):Int;
  public var bytesRead:Int;
  public var bytesWritten:Int;
}
