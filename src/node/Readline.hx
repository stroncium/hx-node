package node;

private typedef InterfaceOptions = {
  input: node.stream.Readable,
  output: node.stream.Writable,
  ?completer: String->Array<Dynamic>,
  ?terminal:Bool,
}

@:native('node.Readline.Interface')
@:event('line', (line:String))
@:event('pause')
@:event('resume')
@:event('close')
@:event('SIGINT')
@:event('SIGTSTP')
@:event('SIGCONT')
private extern class Interface extends EventEmitter{
  static function __init__():Void Node.classify(Interface, EventEmitter);

  public function setPrompt(prompt:String, length:Int):Void;
  public function prompt(?preserveCursor:Bool):Void;
  public function question(query:String, cb:String->Void):Void;
  public function pause():Void;
  public function resume():Void;
  public function close():Void;
  public function write(data:String, ?key:String):Void;
}

@:jsRequire('readline') @:final
extern class Readline{
  public static function createInterface(options:InterfaceOptions):Interface;
}
