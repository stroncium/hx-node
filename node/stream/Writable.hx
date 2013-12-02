package node.stream;

interface Writable{
  // public function hasEventDrain():Void;
  // public function hasEventError():Void;
  // public function hasEventClose():Void;
  // public function hasEventPipe():Void;

  public var writable:Bool;
  public function setEncoding(encoding:String):Void;
  public function destroy():Void;
  public function destroySoon():Void;
  public function write(data:Dynamic, ?encoding:String):Void;
  @:overload(function(?data:Buffer):Void{})
  public function end(data:String, ?encoding:String = 'utf8'):Void;

  public function addListener(event:String,fn:Dynamic):Void;
  public function on(event:String, fn:Dynamic):Void;
  public function once(event:String,fn:Dynamic):Void;
  public function removeListener(event:String,listener:Dynamic):Void;
  public function removeAllListeners(event:String):Void;
  public function listeners(event:String):Array<Dynamic>;
  public function setMaxListeners(m:Int):Void;
  public function emit(event:String,?arg1:Dynamic,?arg2:Dynamic,?arg3:Dynamic, ?arg4:Dynamic):Void;

}
