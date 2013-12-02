package node.stream;

extern class DuplexImpl extends WritableImpl implements Duplex{
  public var readable:Bool;
  // public function setEncoding(encoding:String):Void;
  public function pipe(dst:Writable, ?options:Dynamic):Void;
  public function pause():Void;
  public function resume():Void;
  // public function destroy():Void;
}
