package node;

@:enum abstract UdpType(String){
  var Udp6 = 'udp6';
  var Udp4 = 'udp4';
}

private typedef MsgInfo = {
  address:String,
  port:Int,
};
private typedef UdpAddress = {
  address:String,
  family:String,
  port:Int,
}
private extern class Socket extends EventEmitter{
  // Event: 'message'
  // Event: 'listening'
  // Event: 'close'
  // Event: 'error'

  public function send(buf:Buffer, offset:Int, length:Int, port:Int, host:String, ?cb:Dynamic->Dynamic->Void):Void;
  public function bind(port:Int, ?address:String, ?cb:Dynamic->Void):Void;
  public function close():Void;
  public function address():UdpAddress;
  public function setBroadcast(flag:Bool):Void;
  public function setTTL(ttl:Int):Void;
  public function setMulticastTTL(ttl:Int):Void;
  public function setMulticastLoopback(flag:Bool):Void;
  public function addMembership(multicastAddress:String, ?multicastInterface:String):Void;
  public function dropMembership(multicastAddress:String, ?multicastInterface:String):Void;
  public function unref():Void;
  public function ref():Void;
}

@:jsRequire('dgram')
extern class Udp{
  public static function createSocket(type:UdpType, ?cb:Buffer->MsgInfo->Void):Socket;
}


