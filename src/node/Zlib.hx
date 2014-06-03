package node;

private typedef ZlibOptions = {
  ?flush:Flush,
  ?chunkSize:Int,
  ?windowBits:Int,
  ?level:CompressionLevel,
  ?memLevel:Int,
  ?strategy:CompressionStrategy,
  // ?dictionary:
};

private extern class Flush{}
private extern class ReturnCode{}
private extern class CompressionLevel{}
private extern class CompressionStrategy{}
private extern class DeflateCompressionMethod{}
private extern class DataType{}
private extern class Initializer{}


private extern class Gzip extends Zlib{}
private extern class Gunzip extends Zlib{}
private extern class Deflate extends Zlib{}
private extern class Inflate extends Zlib{}
private extern class DeflateRaw extends Zlib{}
private extern class InflateRaw extends Zlib{}
private extern class Unzip extends Zlib{}

extern class Zlib implements Node.Module<'zlib', ''>{
  public function flush(cb:Void->Void):Void;
  public function reset():Void;

  public static function createGzip(?opts:ZlibOptions):Gzip;
  public static function createGunzip(?opts:ZlibOptions):Gunzip;
  public static function createDeflate(?opts:ZlibOptions):Deflate;
  public static function createInflate(?opts:ZlibOptions):Inflate;
  public static function createDeflateRaw(?opts:ZlibOptions):DeflateRaw;
  public static function createInflateRaw(?opts:ZlibOptions):InflateRaw;
  public static function createUnzip(?opts:ZlibOptions):Unzip;

  public static function deflate(buf:Buffer, cb:Dynamic->Buffer->Void):Void;
  public static function deflateRaw(buf:Buffer, cb:Dynamic->Buffer->Void):Void;
  public static function gzip(buf:Buffer, cb:Dynamic->Buffer->Void):Void;
  public static function gunzip(buf:Buffer, cb:Dynamic->Buffer->Void):Void;
  public static function inflate(buf:Buffer, cb:Dynamic->Buffer->Void):Void;
  public static function inflateRaw(buf:Buffer, cb:Dynamic->Buffer->Void):Void;
  public static function unzip(buf:Buffer, cb:Dynamic->Buffer->Void):Void;

  public static var Z_NO_FLUSH(default,null):Flush;
  public static var Z_PARTIAL_FLUSH(default,null):Flush;
  public static var Z_SYNC_FLUSH(default,null):Flush;
  public static var Z_FULL_FLUSH(default,null):Flush;
  public static var Z_FINISH(default,null):Flush;
  public static var Z_BLOCK(default,null):Flush;
  public static var Z_TREES(default,null):Flush;

  public static var Z_OK(default,null):ReturnCode;
  public static var Z_STREAM_END(default,null):ReturnCode;
  public static var Z_NEED_DICT(default,null):ReturnCode;
  public static var Z_ERRNO(default,null):ReturnCode;
  public static var Z_STREAM_ERROR(default,null):ReturnCode;
  public static var Z_DATA_ERROR(default,null):ReturnCode;
  public static var Z_MEM_ERROR(default,null):ReturnCode;
  public static var Z_BUF_ERROR(default,null):ReturnCode;
  public static var Z_VERSION_ERROR(default,null):ReturnCode;

  public static var Z_NO_COMPRESSION(default,null):CompressionLevel;
  public static var Z_BEST_SPEED(default,null):CompressionLevel;
  public static var Z_BEST_COMPRESSION(default,null):CompressionLevel;
  public static var Z_DEFAULT_COMPRESSION(default,null):CompressionLevel;

  public static var Z_FILTERED(default,null):CompressionStrategy;
  public static var Z_HUFFMAN_ONLY(default,null):CompressionStrategy;
  public static var Z_RLE(default,null):CompressionStrategy;
  public static var Z_FIXED(default,null):CompressionStrategy;
  public static var Z_DEFAULT_STRATEGY(default,null):CompressionStrategy;

  public static var Z_BINARY(default,null):DataType;
  public static var Z_TEXT(default,null):DataType;
  public static var Z_ASCII(default,null):DataType;
  public static var Z_UNKNOWN(default,null):DataType;

  public static var Z_DEFLATED(default,null):DeflateCompressionMethod;

  public static var Z_NULL(default,null):Initializer;
}
