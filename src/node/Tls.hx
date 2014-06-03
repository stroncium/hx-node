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

private typedef SecureContext = Dynamic; //TODO
private typedef SslMethod = Dynamic; //TODO
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

private extern class Server extends Http.HttpServer{
  // Event: 'secureConnection'
  // Event: 'clientError'
  // Event: 'newSession'
  // Event: 'resumeSession'

  public function addContext(hostname:String, creds:Credentials):Void;
}

private extern class SecurePair extends EventEmitter{
  // Event 'secure'
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

private extern class CleartextStream extends node.stream.DuplexImpl{
  //Event 'secureConnect'

  public var authorized(default,null):Bool;
  public var authorizationError(default,null):Dynamic;
  public function getPeerCertificate():PeerCertificate;
  public function getCipher():{name:String, version:String};
  public function address():Address;
  public var remoteAddress(default,null):String;
  public var remotePort(default,null):Int;

}

extern class Tls implements Node.Module<'tls', ''>{
  public static function getCiphers():Array<String>;
  public static function createServer(opts:TlsOpts, ?listener:CleartextStream->Void):Server;


  public static var CLIENT_RENEG_LIMIT:Int;
  public static var CLIENT_RENEG_WINDOW:Float;
  public static var SLAB_BUFFER_SIZE:Int;
  public static function connect(opts:ConnectOpts, ?listener:CleartextStream->Void):CleartextStream;
  public static function createSecurePair(?creds:Credentials, ?isServer:Bool, ?requestCert:Bool, ?rejectUnauthorized:Bool):SecurePair;

}
