package node;
import node.stream.ReadableImpl;
import node.stream.WritableImpl;
import node.Url;

private typedef RequestOptions = {
  ?host:String,
  ?hostname:String,
  ?port:Int,
  ?localAddress:Dynamic, //TODO
  ?socketPath:Dynamic,//TODO
  ?method:String,
  ?path:String,
  ?headers:js.Object,
  ?auth:String,
  ?agent:Dynamic, //TODO
};

@:jsRequire('http')
@:final
extern class Http{
  static function __init__():Void{
    // Node.oo(HttpServer, EventEmitter); //TODO
    // Node.oo(Agent);
    // Node.oo(ServerRequest, node.stream.ReadableImpl, [node.stream.Readable]);
    // Node.oo(ServerResponse, node.stream.WritableImpl, [node.stream.Writable]);
    // Node.oo(ClientResponse, node.stream.ReadableImpl, [node.stream.Readable]);
    // Node.oo(ClientRequest, node.stream.WritableImpl, [node.stream.Writable]);
  }

  public static var STATUS_CODES:Array<String>;
  public static var globalAgent:Agent;
  public static function createServer(listener:ServerRequest->ServerResponse->Void):HttpServer;

  // @:overload(function(options:String, cb:ClientResponse->Void):ClientRequest{})
  public static function request(options:RequestOptions, cb:ClientResponse->Void):ClientRequest;

  // @:overload(function(options:String, cb:ClientResponse->Void):ClientRequest{})
  public static function get(options:RequestOptions, cb:ClientResponse->Void):ClientRequest;



}
@:native('node.Http.Server')
@:event('request', (request:ServerRequest), (response:ServerResponse))
@:event('checkContinue', (request:ServerRequest), (response:ServerResponse))
@:event('connect', (request:ServerRequest), (socket:Net.Socket), (head:Buffer))
@:event('upgrade', (request:ServerRequest), (socket:Net.Socket), (head:Buffer))
@:event('clientError', (error:Dynamic), (socket:Net.Socket))
extern class HttpServer extends Net.NetServer{
  public var maxHeadersCount:Int;
}

@:native('node.Http.IncomingMessage')
@:event('close')
extern class ServerRequest extends ReadableImpl{
  public var method(default,null):String;
  public var url(default, null):String;
  public var headers:js.Object;
  public var trailers(default, null):Dynamic; //TODO
  public var httpVersion(default, null):String;
  // public function pause():Void;
  // public function resume():Void;
  public var connection:Net.Socket;
  public var postData:Dynamic;
  public var postFiles:Dynamic;

  public function setTimeout(msec:Int):Void;
}


@:native('node.Http.ServerResponse')
@:event('close')
@:event('finish')
extern class ServerResponse extends WritableImpl{
  public var statusCode:Int;
  public var sendDate:Bool;
  public function writeContinue():Void;

    @:overload(function (statusCode:Int, reasonPhrase:String, ?headers:js.Object):Void{})
  public function writeHead(statusCode:Int, ?headers:js.Object):Void;
  public function setHeader(name:String, value:String):Void;
  public function getHeader(name:String):String;
  public function removeHeader(name:String):Void;
  public function addTrailers(headers:js.Object):Void;

  @:overload(function(?data:Buffer):Void{})
  override public function end(data:String, ?enc:Encoding):Void;
}

@:native('node.Http.Agent')
extern class Agent{
  public var maxSockets:Int;
  public var sockets:Array<Net.Socket>;
  public var requests:Array<ClientRequest>;
}

@:native('node.Http.ClientRequest')
@:event('response', (response:ServerRequest))
@:event('socket', (socket:Net.Socket))
@:event('connect', (responset:ClientResponse), (socket:Net.Socket), (head:Buffer))
@:event('upgrade', (responset:ClientResponse), (socket:Net.Socket), (head:Buffer))
@:event('continue')
extern class ClientRequest extends WritableImpl{
  public function abort():Void;
  public function setTimeout(timeout:Int, cb:Void->Void):Void;
  public function setNoDelay(?noDelay:Bool = true):Void;
  public function setSocketKeepAlive(?enable:Bool = false ?initialDelay:Int = 0):Void;
}

@:native('node.Http.OutgoingMessage')
extern class ClientResponse extends node.stream.ReadableImpl{
  public var statusCode:Int;
  public var httpVersion:String;
  public var headers:js.Object;
  public var trailers:Dynamic;
}
