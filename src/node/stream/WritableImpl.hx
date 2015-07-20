package node.stream;

@:event('drain')
@:event('error', (error:Dynamic))
@:event('close')
@:event('pipe')
extern class WritableImpl extends EventEmitter implements Writable implements Node.ModuleSub<'stream', '', 'Writable'>{
  // static function __init__():Void Node.classify(WritableImpl, EventEmitter, [Writable]);
  public var writable:Bool;
  public function setEncoding(encoding:Encoding):Void{};
  public function destroy():Void{};
  public function destroySoon():Void{};

  @:overload(function(data:Buffer):Void{})
  public function write(data:String, ?enc:Encoding):Void{};

  @:overload(function(?data:Buffer):Void{})
  public function end(data:String, ?enc:Encoding):Void{};


  public function new(?opts:{?highWaterMark:Int, ?decodeStrings:Bool}):Void;
  function _write(chunk:Dynamic, enc:String, cb:Dynamic->Void):Void;
}
