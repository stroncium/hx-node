package node;
private extern class Timer{
  public function unref():Void;
  public function ref():Void;
}

extern class TimeoutId extends Timer{
  public inline function clear():Void Node.clearTimeout(this);
}

extern class IntervalId extends Timer{
  public inline function clear():Void Node.clearInterval(this);
}

private typedef ImmediateId = Void;

class Node{
  static function __init__():Void untyped{
    setTimeout = js('setTimeout');
    clearTimeout = js('clearTimeout');
    setInterval = js('setInterval');
    clearInterval = js('clearInterval');
    setImmediate = js('setImmediate');
    clearImmediate = js('clearImmediate');
  }
  public static inline function js(str:String):Dynamic return untyped __js__(str);
  public static inline function require(name:String):Dynamic return js('require')(name);


  //todo: arguments
  @:extern public static function setTimeout(cb:Void->Void, delay:Float):TimeoutId return null;
  @:extern public static function clearTimeout(id:TimeoutId):Void{};
  @:extern public static function setInterval(cb:Void->Void, delay:Float):IntervalId return null;
  @:extern public static function clearInterval(id:IntervalId):Void{};
  @:extern public static function setImmediate(cb:Void->Void):ImmediateId return null;
  @:extern public static function clearImmediate(id:ImmediateId):Void{};

  public static function oo(cl:Dynamic, ?sup:Class<Dynamic>, ?ifaces:Array<Class<Dynamic>>):Void untyped {
    cl.__name__ = true;
    if(cl.prototype == null) cl.prototype = {};
    cl.prototype.__class__ = cl;
    Console.log('SUPER');
    if(sup != null) (untyped cl).__super__ = sup;
    if(ifaces != null) cl.__interfaces__ = ifaces;
  }
  public static function requireClass(name:String, ?sup:Class<Dynamic>, ?ifaces:Array<Class<Dynamic>>):Class<Dynamic>{
    var cl = require(name);
    oo(cl, sup, ifaces);
    return cl;
  }

/*
  public static function blessInterface(iface:Class<Dynamic>):Void untyped{
    iface.__name__ = true;
  }
*/
}
