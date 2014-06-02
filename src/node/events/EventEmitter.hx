package node.events;

@:initPackage
class EventEmitter{
  static function __init__():Void untyped EventEmitter = Node.require('events').EventEmitter;
  // Event 'newListener'
  @:extern public function new():Void{};
  @:extern public function addListener(event:String,fn:Dynamic):Void{};
  @:extern public function on(event:String, fn:Dynamic):Void{};
  @:extern public function once(event:String,fn:Dynamic):Void{};
  @:extern public function removeListener(event:String,listener:Dynamic):Void{};
  @:extern public function removeAllListeners(event:String):Void{};
  @:extern public function listeners(event:String):Array<Dynamic>{return null;};
  @:extern public function setMaxListeners(m:Int):Void{};
  @:extern public function emit(event:String,?arg1:Dynamic,?arg2:Dynamic,?arg3:Dynamic, ?arg4:Dynamic):Void{};

  @:extern public static function listenerCount(emitter:EventEmitter, event:String):Int{return 0;};
  }
