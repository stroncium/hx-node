package js;

abstract Object({}) from {} to Dynamic{
  @:extern public inline function new() this = {};
  @:extern
  @:arrayAccess
  public inline function get(k:String):Dynamic return untyped this[k];

  @:extern
  @:arrayAccess
  public inline function set<T>(k:String, v:T):T return untyped this[k] = v;

  @:extern
  public inline function has(k:String) return untyped this.hasOwnProperty(k);

  // public function getKeys():Array<String>{
  //   var o = this, a = [];
  //   untyped __js__('for(var f in o) a.push(f)');
  //   return a;
  // }

  @:extern public inline function getKeys():Array<String> return Reflect.fields(this);

  @:extern
  public inline function unset(k:String):Void{
    untyped __js__('delete ')(this)[k];
  }
}
