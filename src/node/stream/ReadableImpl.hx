package node.stream;

extern class ReadableImpl extends EventEmitter implements Readable implements Node.ModuleSub<'stream', '', 'Readable'>{
  static function __init__():Void Node.classify(ReadableImpl, EventEmitter, [Readable]);
  public var readable:Bool;
  public function setEncoding(encoding:String):Void{};
  public function pause():Void{};
  public function resume():Void{};
  public function destroy():Void{};
  public function new(?opts:{?highWaterMark:Int, ?encoding:String, ?objectMode:Bool}):Void;

  public function pipe<T:Writable>(dst:T, ?options:{?end:Bool}):T{ return dst;};
  public function unpipe(?dst:Writable):Void{};

    @:overload(function(v:Buffer):Void{})
  function push(?v:String, ?enc:String):Void{}

  function _read(size:Int):Void;
}
