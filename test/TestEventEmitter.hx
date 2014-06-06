@:event('test0')
@:event('test1', (dyn:Dynamic))
@:event('test2', (int:Int), (str:String))
class EE extends node.EventEmitter{
}

class TestEventEmitter{

  public static function main(){
    var ee = new EE();
    ee.listeners('test0');
    ee.on('test0', function(){});
    ee.on('test1', function(v:Dynamic){});
    ee.on('test1', function(v:Int){});
    ee.on('test2', function(a:Int, b:String){});
    ee.emit('test0');
    ee.emit('test1', {});
    ee.emit('test2', 1, 'a');

    ee.listeners('non-existent');
    ee.on('test1', function(){});
    ee.on('test2', function(){});
    ee.emit('non-existent');
    ee.emit('test0', 1);
    ee.emit('test1', 1, 2);
    ee.emit('test2', 'a', 1);

  }

  static inline function assert(v:Bool, ?msg = 'Assertion failed'){
    if(!v) throw msg;
  }
}
