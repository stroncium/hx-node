package js;
#if !js #error 'JavaScript only' #end
abstract Object({}) from {} to Dynamic{
  @:arrayAccess public inline function get(k:String):Dynamic {
    return untyped this[k];
  }

  @:arrayAccess public inline function set<T>(k:String, v:T):T{
    return untyped this[k] = v;
  }
}
