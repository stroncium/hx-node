package node;

private abstract SecureContext(Void){}
private abstract SslMethod(Void){}
private typedef HttpsOpts = {
  pfx:Buffer, //or String
  key:Buffer, //or String
  passphrase:String,
  cert:Buffer, //or String
  ?ca:Array<Buffer>, //or Array<String>
  crl:Array<String>, //or String
  ciphers:String, //AES128-GCM-SHA256:RC4:HIGH:!MD5:!aNULL:!EDH
  ?handshakeTimeout:Float,
  ?honorCipherOrder:Bool,
  ?requestCert:Bool,
  ?rejectUnauthorized:Bool,
  NPNPProtocols:Array<String>,
  ?SNICallback:String->SecureContext,
  ?sessionIdContext:String,
  secureProtocol:SslMethod,
};


@:native('node.Https.Server')
private extern class HttpsServer extends Http.HttpServer{
}

@:native('node.Https.Agent')
private extern class Agent {
  public var maxSockets:Int;
  public var sockets:Array<Net.Socket>;
  public var requests:Array<Http.ClientRequest>;
}

@:final
extern class Https implements Node.Module<'https', ''>{
  public static function createServer(opts:HttpsOpts, ?listener:Http.ServerRequest->Http.ServerResponse->Void):HttpsServer;

    @:overload(function(options:String, cb:Http.ClientResponse->Void):Http.ClientRequest{})
  public static function request(options:HttpsRequestOptions, cb:Http.ClientResponse->Void):Http.ClientRequest;

    @:overload(function(options:String, cb:Http.ClientResponse->Void):Http.ClientRequest{})
  public static function get(options:HttpsRequestOptions, cb:Http.ClientResponse->Void):Http.ClientRequest;

  public static var globalAgent:Agent;

  // static function __init__():Void{
  //   Node.oo(Agent);
  //   Node.oo(HttpsServer, Http.HttpServer);
  // }
}


abstract HttpsAgentOption(Dynamic) from Bool from Agent{}
private typedef HttpsRequestOptions = {
  ?host:String,
  ?hostname:String,
  ?port:Int,
  ?localAddress:String,
  ?socketPath:String,
  ?method:String,
  ?path:String,
  ?headers:Dynamic,
  ?auth:String,
  ?agent:HttpsAgentOption,
  ?pfx:BufferOrString,
  ?key:BufferOrString,
  ?passphrase:String,
  ?cert:BufferOrString,
  ?ca:Array<BufferOrString>,
  ?ciphers:String, //AES128-GCM-SHA256:RC4:HIGH:!MD5:!aNULL:!EDH
  ?rejectUnauthorized:Bool,
  ?secureProtocol:SslMethod,
};
