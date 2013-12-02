package node;
import node.stream.ReadableImpl;
import node.stream.WritableImpl;

private typedef RequestOptions = {
  ?host:String,
  ?hostname:String,
  ?port:Int,
  ?localAddress:Dynamic, //TODO
  ?socketPath:Dynamic,//TODO
  ?method:String,
  ?path:String,
  ?headers:Dynamic,
  ?auth:String,
  ?agent:Dynamic, //TODO
};

extern class Http{
  static function __init__():Void{
    untyped Http = Node.require('http');
    Node.oo(HttpServer, EventEmitter);
    Node.oo(Agent);
    Node.oo(ServerRequest, node.stream.ReadableImpl, [node.stream.Readable]);
    Node.oo(ServerResponse, node.stream.WritableImpl, [node.stream.Writable]);
    Node.oo(ClientResponse, node.stream.ReadableImpl, [node.stream.Readable]);
    Node.oo(ClientRequest, node.stream.WritableImpl, [node.stream.Writable]);
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
extern class HttpServer extends Net.NetServer{
  public var maxHeadersCount:Int;
}

@:native('node.Http.IncomingMessage')
extern class ServerRequest extends ReadableImpl{
  public var method(default,null):String;
  public var url(default, null):String;
  public var headers:Dynamic;
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
extern class ServerResponse extends WritableImpl{
  public var statusCode:Int;
  public var sendDate:Bool;
  public function writeContinue():Void;
  //@:overload(function (statusCode:Int, reasonPhrase:String, ?headers:Dynamic<String>):Void{})
  public function writeHead(statusCode:Int, ?headers:Dynamic<String>):Void;
  public function setHeader(name:String, value:String):Void;
  public function getHeader(name:String):String;
  public function removeHeader(name:String):Void;
  public function addTrailers(headers:Dynamic):Void;

  @:overload(function(?data:Buffer):Void{})
  override public function end(data:String, ?encoding:String = 'utf8'):Void;
}

@:native('node.Http.Agent')
extern class Agent{
  public var maxSockets:Int;
  public var sockets:Array<Net.Socket>;
  public var requests:Array<ClientRequest>;
}

@:native('node.Http.ClientRequest')
extern class ClientRequest extends WritableImpl{
  public function abort():Void;
  public function setTimeout(timeout:Int, cb:Void->Void):Void;
  public function setNoDelay(?noDelay:Bool = true):Void;
  public function setSocketKeepAlive(?enable:Bool = false ?initialDelay:Int = 0):Void;
}

@:native('node.Http.ClientRequest')
extern class ClientResponse extends node.stream.ReadableImpl{
  public var statusCode:Int;
  public var httpVersion:String;
  public var headers:Dynamic;
  public var trailers:Dynamic;
}
