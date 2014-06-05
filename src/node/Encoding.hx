package node;

@:enum
abstract Encoding(String) #if !debug from String #end{
  inline var Hex = 'hex';
  inline var Utf8 = 'utf8';
  inline var Ascii = 'ascii';
  inline var Binary = 'binary';
  inline var Base64 = 'base64';
  inline var Ucs2 = 'ucs2';
  inline var Utf16LE = 'utf16le';
  inline var Raw = 'raw';

  #if debug
    static var allowedNames:Array<String> = 'hex|utf8|ascii|binary|base64|ucs2|utf16le|raw'.split('|');
    @:from public static function fromString(v:String):Encoding{
      if(allowedNames.indexOf(v) == -1) throw 'Unkown encoding: $v';
      return untyped v;
    }
  #end
}
