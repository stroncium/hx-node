package node.stream;

@:event('data', (data:Dynamic))
@:event('end')
@:event('drain')
@:event('error', (error:Dynamic))
@:event('close')
@:event('pipe')
@:keep
extern class DuplexImpl extends EventEmitter implements Duplex implements Writable implements Readable implements Node.ModuleSub<'stream', '', 'Duplex'>{
  // static function __init__():Void Node.classify(DuplexImpl, EventEmitter, [Readable, Writable]);
  public var writable:Bool;
  public var readable:Bool;
  public function setEncoding(encoding:Encoding):Void{};
  public function destroy():Void{};
  public function destroySoon():Void{};

  @:overload(function(data:Buffer):Void{})
  public function write(data:String, ?enc:Encoding):Void{};

  @:overload(function(?data:Buffer):Void{})
  public function end(data:String, ?enc:Encoding):Void{};


  public function new(?opts:{?highWaterMark:Int, ?decodeStrings:Bool}):Void{super();};
  function _write(chunk:Dynamic, enc:String, cb:Dynamic->Void):Void{};

  function _read(size:Int):Void{};

  public function pause():Void{};
  public function resume():Void{};
}
