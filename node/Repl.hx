package node;

private extern class ReplServer extends EventEmitter{
  // Event: 'exit'
}
private typedef ReplOptions = {
  ?prompt:String,
  ?input: node.stream.Readable,
  ?output: node.stream.Writable,
  ?completer: String->Array<Dynamic>,
  ?terminal:Bool,
  ?eval:String->Dynamic->String->(Dynamic->Dynamic->Void)->Void,
  ?useColors:Bool,
  ?useGlobal:Bool,
  ?ignoreUndefined:Bool,
  ?writer:Dynamic,
}

extern class Repl{
  static function __init__():Void untyped Repl = Node.require('repl');

  public static function start(?options:ReplOptions):ReplServer;
}
