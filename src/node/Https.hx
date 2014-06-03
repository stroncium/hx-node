package node;

private extern class SecureContext{}
private extern class SslMethod{}
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
// server.listen(port, [host], [backlog], [callback])
// server.listen(path, [callback])
// server.listen(handle, [callback])
// server.close([callback])

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
  //TODO
  // public static function request(opts, cb):Void;
  // public static function get(opts, cb):Void;
  public static var globalAgent:Agent;

  // static function __init__():Void{
  //   Node.oo(Agent);
  //   Node.oo(HttpsServer, Http.HttpServer);
  // }
}
