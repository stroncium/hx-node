package node.stream;

class ReadableImpl extends EventEmitter implements Readable{
  static var nodeImpl:Dynamic;
  static function __init__():Void{
    nodeImpl = Node.require('stream').Readable;
    (untyped ReadableImpl).prototype.__proto__ = nodeImpl.prototype;
  }
  public inline function new(?opts:{?highWaterMark:Int, ?encoding:String, ?objectMode:Bool}){
    super();
    nodeImpl.call(this, opts);
  }

  public var readable:Bool;
  function _read(size:Int){
    throw '_write not implemented in ${Type.getClassName(Type.getClass(this))} extending node.stream.ReadableImpl';
  }
  @:overload(function(v:Buffer):Void{})
  @:extern function push(?v:String, ?enc:String):Void{}

  @:extern public function setEncoding(encoding:String):Void{};
  @:extern public function pipe<T:Writable>(dst:T, ?options:{?end:Bool}):T{ return dst;};
  @:extern public function unpipe(?dst:Writable):Void{};
  @:extern public function pause():Void{};
  @:extern public function resume():Void{};
  @:extern public function destroy():Void{};
}
