package node;

private typedef InterfaceOptions = {
  input: node.stream.Readable,
  output: node.stream.Writable,
  ?completer: String->Array<Dynamic>,
  ?terminal:Bool,
}

@:event('line', (line:String))
@:event('pause')
@:event('resume')
@:event('close')
@:event('SIGINT')
@:event('SIGTSTP')
@:event('SIGCONT')
private extern class Interface extends EventEmitter implements Node.ModuleSub<'readline', '', 'Interface'>{
  // static function __init__():Void Node.classify(Interface, EventEmitter);

  public function setPrompt(prompt:String, length:Int):Void;
  public function prompt(?preserveCursor:Bool):Void;
  public function question(query:String, cb:String->Void):Void;
  public function pause():Void;
  public function resume():Void;
  public function close():Void;
  public function write(data:String, ?key:String):Void;
}

@:final
extern class Readline implements Node.Module<'readline', ''>{
  public static function createInterface(options:InterfaceOptions):Interface;
}
