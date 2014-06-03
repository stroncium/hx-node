package node;

extern class Buffer implements ArrayAccess<Int> implements Node.ModuleSub<'buffer', '', 'Buffer'>{
  public static function concat(buffers:Array<Buffer>, ?byteLength:Int):Buffer;

  @:overload(function(str:String,?enc:Encoding):Void {})
  @:overload(function(arr:Array<Int>):Void {})
  function new(size:Int):Void;

  var length(default,null) : Int;
  var INSPECT_MAX_BYTES:Int;

  function copy(targetBuffer:Buffer,targetStart:Int,sourceStart:Int,sourceEnd:Int):Void;
  function slice(start:Int,end:Int):Buffer;
  function write(s:String,?offset:Int,?length:Int,?enc:Encoding):Int;
  function toString(enc:Encoding,?start:Int,?end:Int):String;
  function fill(value:Float,offset:Int,?end:Int):Void;
  static function isBuffer(o:Dynamic):Bool;
  static function byteLength(s:String,?enc:Encoding):Int;

  function readUInt8(offset:Int,?noAssert:Bool):Int;
  function readUInt16LE(offset:Int,?noAssert:Bool):Int;
  function readUInt16BE(offset:Int,?noAssert:Bool):Int;
  function readUInt32LE(offset:Int,?noAssert:Bool):Int;
  function readUInt32BE(offset:Int,?noAssert:Bool):Int;

  function readInt8(offset:Int,?noAssert:Bool):Int;
  function readInt16LE(offset:Int,?noAssert:Bool):Int;
  function readInt16BE(offset:Int,?noAssert:Bool):Int;
  function readInt32BE(offset:Int,?noAssert:Bool):Int;

  function readFloatLE(offset:Int,?noAssert:Bool):Float;
  function readFloatBE(offset:Int,?noAssert:Bool):Float;
  function readDoubleLE(offset:Int,?noAssert:Bool):Float; // is this right?
  function readDoubleBE(offset:Int,?noAssert:Bool):Float; // is this right?

  function writeUInt8(value:Int,offset:Int,?noAssert:Bool):Void;
  function writeUInt16LE(value:Int,offset:Int,?noAssert:Bool):Void;
  function writeUInt16BE(value:Int,offset:Int,?noAssert:Bool):Void;
  function writeUInt32LE(value:Int,offset:Int,?noAssert:Bool):Void;
  function writeUInt32BE(value:Int,offset:Int,?noAssert:Bool):Void;

  function writeInt8(value:Int,offset:Int,?noAssert:Bool):Void;
  function writeInt16LE(value:Int,offset:Int,?noAssert:Bool):Void;
  function writeInt16BE(value:Int,offset:Int,?noAssert:Bool):Void;
  function writeInt32BE(value:Int,offset:Int,?noAssert:Bool):Void;

  function writeFloatLE(value:Float,offset:Int,?noAssert:Bool):Void;
  function writeFloatBE(value:Float,offset:Int,?noAssert:Bool):Void;
  function writeDoubleLE(value:Float,offset:Int,?noAssert:Bool):Void; // is this right?
  function writeDoubleBE(value:Float,offset:Int,?noAssert:Bool):Void; // is this right?

  function readInt32LE(offset:Int,?noAssert:Bool):Int;
  function writeInt32LE(value:Int,offset:Int,?noAssert:Bool):Void;
  // public inline function readInt32LE(off:Int):Int{
  //   return
  //     this[off] |
  //     this[off+1] << 8 |
  //     this[off+2] << 16 |
  //     this[off+3] << 24
  //   ;
  // }
  // public inline function writeInt32LE(v:Int, off:Int):Int{
  //   this[off] = v & 0xFF;
  //   this[off+1] = (v >> 8) & 0xFF;
  //   this[off+2] = (v >> 16) & 0xFF;
  //   this[off+3] = (v >> 24) & 0xFF;
  //   return v;
  // }

}
