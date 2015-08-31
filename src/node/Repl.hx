package node;

@:event('exit')
@:jsRequire('repl', 'REPLServer')
private extern class ReplServer extends EventEmitter{
  // static function __init__():Void Node.classify(ReplServer, EventEmitter);
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

@:final
@:jsRequire('repl')
extern class Repl{
  public static function start(?options:ReplOptions):ReplServer;
}
