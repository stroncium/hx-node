package node;

private typedef InterfaceOptions = {
  input: node.stream.Readable,
  output: node.stream.Writable,
  ?completer: String->Array<Dynamic>,
  ?terminal:Bool,
}

private extern class Interface extends EventEmitter{

  /*
  Events:
    'line'
    'pause'
    'resume'
    'close'
    'SIGINT'
    'SIGTSTP'
    'SIGCONT'
  */

  public function setPrompt(prompt:String, length:Int):Void;
  public function prompt(?preserveCursor:Bool):Void;
  public function question(query:String, cb:String->Void):Void;
  public function pause():Void;
  public function resume():Void;
  public function close():Void;
  public function write(data:String, ?key:String):Void;
}

extern class Readline{
  static function __init__():Void untyped  Readline = Node.require('readline');

  public static function createInterface(options:InterfaceOptions):Interface;
}
