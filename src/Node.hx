@:autoBuild(node.Macros.macroModule(false)) extern interface Module<Const, Const>{}
@:autoBuild(node.Macros.macroModule(true)) extern interface ModuleSub<Const, Const, Const>{}

class Node{

  public static var Object:Dynamic;
  public static var filename(default, null):String;
  public static var dirname(default, null):String;
  public static var module(default, null):Dynamic;
  public static var process(default, null): node.Process;
  static function __init__():Void untyped{
    Object = js('Object');
    setTimeout = js('setTimeout');
    clearTimeout = js('clearTimeout');
    setInterval = js('setInterval');
    clearInterval = js('clearInterval');
    setImmediate = js('setImmediate');
    clearImmediate = js('clearImmediate');
    filename = js('__filename');
    dirname = js('__dirname');
    module = js('module');
    process = js('process');
  }

  @:extern public static inline function proto(cl:Class<Dynamic>):Dynamic return untyped cl.prototype;

  @:extern public static inline function js(str:String):Dynamic return untyped __js__(str);
  @:extern public static inline function typeof(v:Dynamic) return js('typeof')(v);

  @:extern public static function setTimeout(cb:Void->Void, delay:Float):TimeoutId return null;
  @:extern public static function clearTimeout(id:TimeoutId):Void{};
  @:extern public static function setInterval(cb:Void->Void, delay:Float):IntervalId return null;
  @:extern public static function clearInterval(id:IntervalId):Void{};
  @:extern public static function setImmediate(cb:Void->Void):ImmediateId return null;
  @:extern public static function clearImmediate(id:ImmediateId):Void{};

  @:extern public static inline function isUndefined(v:Dynamic) return js('void 0 === ')(v);
  @:extern public static inline function isNotUndefined(v:Dynamic) return js('void 0 !== ')(v);

  public static var undefined(get, null):Dynamic;

  @:extern public static function get_undefined() return js('void 0');

  public static function classify<SC, C:SC>(cl:Class<C>, sup:Class<SC>, ?ifaces:Array<Class<Dynamic>>){
    // cl.__name__ = true; //TODO
    untyped if(cl.prototype == null) cl.prototype = {};
    untyped cl.prototype.__class__ = cl;
    if(ifaces != null) untyped cl.__interfaces__ = ifaces;
    if(sup != null) untyped cl.__super__ = sup;
  }

}

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


