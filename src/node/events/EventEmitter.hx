package node.events;
#if (!untype_events && macro)
  import haxe.macro.Expr;
  import haxe.macro.Context;
  import haxe.macro.Type;
  using haxe.macro.Tools;
#end


@:event('newListener', (event:String), (fn:Dynamic))
@:event('removeListener', (event:String), (fn:Dynamic))
extern class EventEmitter implements Node.ModuleSub<'events', '', 'EventEmitter'>{
  public function new():Void;
  public function setMaxListeners(m:Int):Void;

  public static function listenerCount(emitter:EventEmitter, event:String):Int;

  #if untype_events
    public function emit(event:String,?arg1:Dynamic,?arg2:Dynamic,?arg3:Dynamic, ?arg4:Dynamic):Void;
    public function addListener(event:String,fn:Dynamic):Void;
    public function once(event:String,fn:Dynamic):Void;
    public function removeListener(event:String,listener:Dynamic):Void;
    public function removeAllListeners(event:String):Void;
    public function listeners(event:String):Array<Dynamic>;
    public function on(event:String, fn:Dynamic):Void;
  #end

  public inline function unsafeEmit(event:String,?arg1:Dynamic,?arg2:Dynamic,?arg3:Dynamic, ?arg4:Dynamic):Void (untyped this).emit(event, arg1, arg2, arg3, arg4);
  public inline function unsafeOn(event:String, fn:Dynamic):Void (untyped this).on(event, fn);
  public inline function unsafeAddListener(event:String,fn:Dynamic):Void (untyped this).addListener(event, fn);
  public inline function unsafeOnce(event:String,fn:Dynamic):Void (untyped this).once(event, fn);
  public inline function unsafeRemoveListener(event:String, fn:Dynamic):Void (untyped this).removeListener(event, fn);
  public inline function unsafeRemoveAllListeners(event:String):Void (untyped this).removeAllListeners(event);
  public inline function unsafeListeners(event:String):Array<Dynamic> return (untyped this).listeners(event);


  #if !untype_events
    @:extern public macro function on(that:haxe.macro.Expr, event:String, fn:haxe.macro.Expr){
      checkEventFn(that, event, fn);
      return macro $that.unsafeOn($v{event}, $fn);
    }
    @:extern public macro function addEventListener(that:haxe.macro.Expr, event:String, fn:haxe.macro.Expr){
      checkEventFn(that, event, fn);
      return macro $that.unsafeAddEventListener($v{event}, $fn);
    }

    @:extern public macro function removeListener(that:haxe.macro.Expr, event:String, fn:haxe.macro.Expr){
      checkEventFn(that, event, fn);
      return macro $that.unsafeRemoveListener($v{event}, $fn);
    }

    @:extern public macro function once(that:haxe.macro.Expr, event:String, fn:haxe.macro.Expr){
      checkEventFn(that, event, fn);
      return macro $that.unsafeOnce($v{event}, $fn);
    }

    @:extern public macro function removeAllListeners(that:haxe.macro.Expr, event:String){
      checkEvent(that, event);
      return macro $that.unsafeRemoveAllListeners($v{event});
    }

    @:extern public macro function listeners(that:haxe.macro.Expr, event:String, fn:haxe.macro.Expr){
      var type = checkEvent(that, event);
      var ctype = type.toComplexType();
      return macro ($that.unsafeListeners($v{event}, $fn):$ctype);
    }

    @:extern public macro function emit(that:haxe.macro.Expr, event:String, args:Array<haxe.macro.Expr>){
      var type = checkEvent(that, event);
      switch(type){
        case TFun(targs, _):
          if(targs.length != args.length){
            Context.error('@:event "$event" should have ${targs.length} arguments', Context.currentPos());
            return null;
          }
          for(i in 0...args.length){
            var atype = Context.typeof(args[i]);
            var type = targs[i].t;
            if(!Context.unify(atype, type)){
              Context.error('${cl.name} @:event "$event" argument ${i+1} should be of type ${type.toString()}, not ${atype.toString()}', fn.pos);
              return null;
            }
          }
          args.unshift(macro $v{event});
          return macro (untyped $that).emit($a{args});
        case _: throw 'impossible';
      }
    }
  #end
  #if macro
    static var classCache:Map<String, Map<String, Type>> = new Map();
    static function __init__():Void{
      Context.onMacroContextReused(function(){
        classCache = new Map();
        return true;
      });
    }

    static inline function checkEventFn(that:Expr, event:String, fn:Expr){
      var cl = getInstClass(that);
      var type = getEventData(cl, event);
      var fntype = Context.typeof(fn);
      if(!Context.unify(fntype, type)){
        Context.error('${cl.name} @:event "$event" listener should be of type ${type.toString()}, not ${fntype.toString()}', fn.pos);
      }
    }

    static inline function checkEvent(that:Expr, event:String){
      var cl = getInstClass(that);
      return getEventData(cl, event);
    }

    static function getEventData(baseClass:ClassType, event:String):Null<Type>{
      var cl = baseClass;
      while(cl != null){
        var uid = cl.module+'|'+cl.name;
        if(!classCache.exists(uid)) classCache[uid] = extractEvents(cl);
        var type = classCache[uid][event];
        if(type != null) return type;

        if(cl.superClass == null) cl = null;
        else cl = cl.superClass.t.get();
      }
      Context.error('class ${baseClass.name} doesn\'t have @:event \'$event\' declared', Context.currentPos());
      return null;
    }

    static inline function getInstClass(e:Expr){
      var cl;
      switch(Context.typeof(e)){
        case TInst(c, _): cl = c.get();
        case _: throw 'Not a class instance';
      }
      return cl;
    }

    static function extractEvents(cl:ClassType):Map<String, Type>{
      var map = new Map();
      if(cl.meta.has(':event')){
        var meta = [for(m in cl.meta.get()) if(m.name == ':event') m];
        for(m in meta){
          if(m.params.length < 1) throw 'invalid :event meta $m';
          var event;
          switch(m.params[0].expr){
            case EConst(CString(ev)):
              event = ev;
            case _: throw 'invalid :event meta $m';
          }
          var args = [for(i in 1...m.params.length){
            var e = m.params[i];
            switch(e.expr){
              case EParenthesis({expr:ECheckType({expr:EConst(CIdent(name))}, ctype)}):
                var type = ctype.toType();
                {name:name, t:type, opt:false};
              case e: throw 'error';
            }
          }];
          var fntype = TFun(args, Context.getType('Void'));
          map[event] = fntype;
        }
      }
      return map;
    }

  #end

}
