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
  public static var Object:Dynamic;
  static function __init__():Void untyped{
    Object = js('Object');
    setTimeout = js('setTimeout');
    clearTimeout = js('clearTimeout');
    setInterval = js('setInterval');
    clearInterval = js('clearInterval');
    setImmediate = js('setImmediate');
    clearImmediate = js('clearImmediate');
    require = js('require');
    Object.defineProperty(proto(Array), '__class__', {enumerable:false, writable:true, configurable:false});
    }

  @extern public static inline function proto(cl:Class<Dynamic>):Dynamic return untyped cl.prototype;

  // public static var _require:Dynamic;
  public static var require:String->Dynamic;

  @:extern public static inline function js(str:String):Dynamic return untyped __js__(str);
  @:extern public static inline function typeof(v:Dynamic) return js('typeof')(v);

  @:extern public static inline function resolve(name:String):String return untyped require.resolve(name);
  // public static inline function requireSub(name:String, sub:String){
  //   return require(node.Path.dirname(resolve(name))+'/'+sub);
  // }

  //todo: arguments
  @:extern public static function setTimeout(cb:Void->Void, delay:Float):TimeoutId return null;
  @:extern public static function clearTimeout(id:TimeoutId):Void{};
  @:extern public static function setInterval(cb:Void->Void, delay:Float):IntervalId return null;
  @:extern public static function clearInterval(id:IntervalId):Void{};
  @:extern public static function setImmediate(cb:Void->Void):ImmediateId return null;
  @:extern public static function clearImmediate(id:ImmediateId):Void{};

  @:extern public static function isUndefined(v:Dynamic) return js('void 0 === ')(v);

  public static function oo(cl:Dynamic, ?sup:Class<Dynamic>, ?ifaces:Array<Class<Dynamic>>):Void untyped {
    cl.__name__ = true;
    if(cl.prototype == null) cl.prototype = {};
    cl.prototype.__class__ = cl;
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