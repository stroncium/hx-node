package node;

private extern class DnsError{ // TODO
  public var code(default,null):DnsErrorCode;
}

private abstract DnsErrorCode(Void){}
private typedef ResCb<T> = DnsError->Array<T>->Void;

@:jsRequire('dns')
@:final
extern class Dns{
  public static function lookup(domain:String, ?family:Null<Int>, cb:Dynamic->String->Int->Void):Void;
  public static function resolve(domain:String, ?rrtype:String, cb:ResCb<Dynamic>):Void;
  public static function resolve4(domain:String, cb:ResCb<String>):Void;
  public static function resolve6(domain:String, cb:ResCb<String>):Void;
  public static function resolveMx(domain:String, cb:ResCb<{priority:Int, exchange:String}>):Void;
  public static function resolveTxt(domain:String, cb:ResCb<String>):Void;
  public static function resolveSrv(domain:String, cb:ResCb<{priority:Int, weight:Int, port:Int, name:String}>):Void;
  public static function resolveNs(domain:String, cb:ResCb<String>):Void;
  public static function resolveCname(domain:String, cb:ResCb<String>):Void;
  public static function reverse(ip:String, cb:ResCb<String>):Void;



  public static var NODATA(default,null):DnsErrorCode;
  public static var FORMERR(default,null):DnsErrorCode;
  public static var SERVFAIL(default,null):DnsErrorCode;
  public static var NOTFOUND(default,null):DnsErrorCode;
  public static var NOTIMP(default,null):DnsErrorCode;
  public static var REFUSED(default,null):DnsErrorCode;
  public static var BADQUERY(default,null):DnsErrorCode;
  public static var BADNAME(default,null):DnsErrorCode;
  public static var BADFAMILY(default,null):DnsErrorCode;
  public static var BADRESP(default,null):DnsErrorCode;
  public static var CONNREFUSED(default,null):DnsErrorCode;
  public static var TIMEOUT(default,null):DnsErrorCode;
  public static var EOF(default,null):DnsErrorCode;
  public static var FILE(default,null):DnsErrorCode;
  public static var NOMEM(default,null):DnsErrorCode;
  public static var DESTRUCTION(default,null):DnsErrorCode;
  public static var BADSTR(default,null):DnsErrorCode;
  public static var BADFLAGS(default,null):DnsErrorCode;
  public static var NONAME(default,null):DnsErrorCode;
  public static var BADHINTS(default,null):DnsErrorCode;
  public static var NOTINITIALIZED(default,null):DnsErrorCode;
  public static var LOADIPHLPAPI(default,null):DnsErrorCode;
  public static var ADDRGETNETWORKPARAMS(default,null):DnsErrorCode;
  public static var CANCELLED(default,null):DnsErrorCode;
}
