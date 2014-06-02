package node;

@:jsRequire('string_decoder', 'StringDecoder')
extern class StringDecoder{
  public static var encoding:Encoding;
  public function new(?enc:Encoding):Void;
  public function write(buf:Buffer):String;
}
