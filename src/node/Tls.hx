package node;


private typedef TlsOpts = {
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

private abstract SecureContext(Void){}
private abstract SslMethod(Void){}
// private typedef SecureContext = Dynamic;
// private typedef SslMethod = Dynamic;
private typedef ConnectOpts = {
  ?host:String,
  ?port:Int,
  ?socket:Net.Socket,
  pfx:Buffer, //or String
  key:Buffer, //or String
  passphrase:String,
  cert:Buffer, //or String
  ?ca:Array<Buffer>, //or Array<String>
  ?rejectUnauthorized:Bool,
  NPNPProtocols:Array<String>,
  servername:String,
  secureProtocol: SslMethod,
};

private typedef Credentials = node.Crypto.Credentials;

private typedef ServerCredentials = {
  ?key:Buffer,
  ?cert:Buffer,
  ?ca:Array<Buffer>,
};

@:event('secureConnection', (stream:CleartextStream))
@:event('clientError', (error:Dynamic), (pair:SecurePair))
@:event('newSession', (id:Buffer), (data:Dynamic))
@:event('resumeSession', (id:Buffer), (callback:Dynamic->Dynamic->Void))
private extern class Server extends Http.HttpServer{
  public function addContext(hostname:String, creds:Credentials):Void;
}

@:event('secure')
private extern class SecurePair extends EventEmitter{
  public var cleartext:CleartextStream;
  public var encrypted:CryptoStream;
}

private extern class CryptoStream{
  public var bytesWritten(default,null):Int;
}

private typedef PeerCertificate = Dynamic;

private typedef Address = {
  port: Int,
  family: String,
  address: String,
};

@:event('secureConnect')
private extern class CleartextStream extends node.stream.DuplexImpl{
  public var authorized(default,null):Bool;
  public var authorizationError(default,null):Dynamic;
  public function getPeerCertificate():PeerCertificate;
  public function getCipher():{name:String, version:String};
  public function address():Address;
  public var remoteAddress(default,null):String;
  public var remotePort(default,null):Int;

}

@:final
@:jsRequire('tls')
extern class Tls{
  public static function getCiphers():Array<String>;
  public static function createServer(opts:TlsOpts, ?listener:CleartextStream->Void):Server;


  public static var CLIENT_RENEG_LIMIT:Int;
  public static var CLIENT_RENEG_WINDOW:Float;
  public static var SLAB_BUFFER_SIZE:Int;
  public static function connect(opts:ConnectOpts, ?listener:CleartextStream->Void):CleartextStream;
  public static function createSecurePair(?creds:Credentials, ?isServer:Bool, ?requestCert:Bool, ?rejectUnauthorized:Bool):SecurePair;

}
