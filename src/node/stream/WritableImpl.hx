package node.stream;

class WritableImpl extends EventEmitter implements Writable{
  static var nodeImpl:Dynamic;
  static function __init__():Void{
    nodeImpl = Node.require('stream').Writable;
    (untyped WritableImpl).prototype.__proto__ = nodeImpl.prototype;
  }
  public inline function new(?opts:{?highWaterMark:Int, ?decodeStrings:Bool}){
    super();
    nodeImpl.call(this, opts);
  }
  public var writable:Bool;
  @:extern public function setEncoding(encoding:String):Void{};
  @:extern public function destroy():Void{};
  @:extern public function destroySoon():Void{};
  @:extern public function write(data:Dynamic, ?encoding:String):Void{};
  @:overload(function(?data:Buffer):Void{})
  @:extern public function end(data:String, ?encoding:String = 'utf8'):Void{};
  function _write(chunk:Dynamic, enc:String, cb:Dynamic->Void){
    throw '_write not implemented in ${Type.getClassName(Type.getClass(this))} extending node.stream.WritableImpl';
  }
}
