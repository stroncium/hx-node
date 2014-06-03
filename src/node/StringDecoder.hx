package node;

extern class StringDecoder implements Node.ModuleSub<'string_decoder', '', 'StringDecoder'>{
  public static var encoding:Encoding;
  public function new(?enc:Encoding):Void;
  public function write(buf:Buffer):String;
}
