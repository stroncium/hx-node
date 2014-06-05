package node;

@:enum abstract UdpType(String) #if !debug from String #end{
  var Udp6 = 'udp6';
  var Udp4 = 'udp4';
  #if debug
    @:from public static function fromString(v:String):UdpType{
      if(v != 'udp6' && v != 'udp4') throw 'Unkown UDP type: $v';
      return untyped v;
    }
  #end
}

private typedef UdpAddress = {
  address:String,
  family:String,
  port:Int,
}

private typedef UdpMsgInfo = { > UdpAddress,
  size:Int,
};

@:event('message', (msg:Buffer), (info:MsgInfo))
@:event('listening')
@:event('close')
@:event('error', (error:js.Error))
private extern class UdpSocket extends EventEmitter{
  public function send(buf:Buffer, offset:Int, length:Int, port:Int, host:String, ?cb:Dynamic->Buffer->Void):Void;
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

extern class Udp implements Node.Module<'dgram', ''>{
  public static function createSocket(type:UdpType, ?cb:Buffer->MsgInfo->Void):UdpSocket;
}


