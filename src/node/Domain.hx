package node;

extern class Domain implements Node.Module<'domain', ''>{
  public static function create():Domain;

  public function run(fn:Void->Void):Void;
  public var members(default,null):Array<Dynamic>;

  @:overload(function(timer:Node.TimeoutId):Void{})
  @:overload(function(timer:Node.IntervalId):Void{})
  public function add(emitter:EventEmitter):Void;

  @:overload(function(timer:Node.TimeoutId):Void{})
  @:overload(function(timer:Node.IntervalId):Void{})
  public function remove(emitter:EventEmitter):Void;
  public function bind<T>(fn:T):T;
  public function intercept<T>(fn:T):T;
  public function enter():Void;
  public function exit():Void;
  public function dispose():Void;
}
