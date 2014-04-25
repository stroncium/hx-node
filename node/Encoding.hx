package node;
@:fakeEnum(String) extern enum Encoding{
  hex;
  utf8;
  ascii;
  binary;
  base64;
  ucs2;
  utf16le;
  raw;
}
@:native('node.Encoding')
class EncodingImpl{
  public static inline var hex = 'hex';
  public static inline var utf8 = 'utf8';
  public static inline var ascii = 'ascii';
  public static inline var binary = 'binary';
  public static inline var base64 = 'base64';
  public static inline var ucs2 = 'ucs2';
  public static inline var utf16le = 'utf16le';
  public static inline var raw = 'raw';
}
