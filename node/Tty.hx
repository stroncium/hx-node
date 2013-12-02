package node;

private extern class ReadStream extends node.stream.ReadableImpl{
  public var isRaw(default,null):Bool;
  public function setRawMode(mode:Bool):Void;
}
private extern class WriteStream extends node.stream.WritableImpl{
  // Event 'resize'
  public var columns(default,null):Int;
  public var rows(default,null):Int;
}

extern class Tty{
  static function __init__():Void untyped Tty = Node.require('tty');

  public static function isatty(fd:node.Fs.FileDescriptor):Bool;
}
