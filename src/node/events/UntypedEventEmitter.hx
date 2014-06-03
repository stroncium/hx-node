package node.events;

@:event('newListener', (event:String), (fn:Dynamic))
@:event('removeListener', (event:String), (fn:Dynamic))
extern class UntypedEventEmitter implements Node.ModuleSub<'events', '', 'EventEmitter'>{
  public function new():Void;
  public function setMaxListeners(m:Int):Void;

  public static function listenerCount(emitter:EventEmitter, event:String):Int;

  public function emit(event:String,?arg1:Dynamic,?arg2:Dynamic,?arg3:Dynamic, ?arg4:Dynamic):Void;

  public function emit(event:String,?arg1:Dynamic,?arg2:Dynamic,?arg3:Dynamic, ?arg4:Dynamic):Void;
  public function addListener(event:String,fn:Dynamic):Void;
  public function once(event:String,fn:Dynamic):Void;
  public function removeListener(event:String,listener:Dynamic):Void;
  public function removeAllListeners(event:String):Void;
  public function listeners(event:String):Array<Dynamic>;
  public function on(event:String, fn:Dynamic):Void;

  public inline function unsafeOn(event:String, fn:Dynamic):Void (untyped this).on(event, fn);
  public inline function unsafeAddListener(event:String,fn:Dynamic):Void (untyped this).addListener(event, fn);
  public inline function unsafeOnce(event:String,fn:Dynamic):Void (untyped this).once(event, fn);
  public inline function unsafeRemoveListener(event:String, fn:Dynamic):Void (untyped this).removeListener(event, fn);
  public inline function unsafeRemoveAllListeners(event:String):Void (untyped this).removeAllListeners(event);
  public inline function unsafeListeners(event:String):Array<Dynamic> return (untyped this).listeners(event);
  
}
