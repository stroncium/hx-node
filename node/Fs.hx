package node;

private typedef CB = Dynamic->Void;
extern class FileDescriptor{}

private typedef FileOpenFlags = String;
private typedef SymlinkType = String;

    // FileOpenFlags = {Read: 'r', R: 'r',ReadWrite: 'r+', RPlus: 'r+',ReadSync: 'rs', RS: 'rs',ReadWriteSync: 'rs+', RSPlus: 'rs+',Write: 'w', W: 'w',WriteExclusive: 'wx', WX: 'wx',WriteRead: 'w+', WPlus: 'w+',WriteReadExclusive: 'wx+', WXPlus: 'wx+',Append: 'a', A: 'a',AppendExclusive: 'ax', AX: 'ax',ReadAppend: 'a+', APlus: 'a+',ReadAppendExclusive: 'ax+', AXPlus: 'ax+', Custom: function(s){return s;}};
    // SymlinkType = {Dir:'dir', File:'file', Junction:'junction', Custom: function(s){return s;} };
// @:native('node.Fs.SymlinkType')
// extern enum SymlinkType{ Dir; File; Junction; Custom(s:String); }

// @:fakeEnum(String) abstract FileOpenFlags{
//   Read; R; //Open file for reading. An exception occurs if the file does not exist.
//   ReadWrite; RPlus; //Open file for reading and writing. An exception occurs if the file does not exist.
//   ReadSync; RS; //Open file for reading in synchronous mode. Instructs the operating system to bypass the local file system cache.
//   ReadWriteSync; RSPlus; //Open file for reading and writing, telling the OS to open it synchronously. See notes for 'rs' about using this with caution.
//   Write; W; //Open file for writing. The file is created (if it does not exist) or truncated (if it exists).
//   WriteExclusive; WX; //Like 'w' but opens the file in exclusive mode.
//   WriteRead; WPlus; //Open file for reading and writing. The file is created (if it does not exist) or truncated (if it exists).
//   WriteReadExclusive; WXPlus; //Like 'w+' but opens the file in exclusive mode.
//   Append; A; //Open file for appending. The file is created if it does not exist.
//   AppendExclusive; AX; //Like 'a' but opens the file in exclusive mode.
//   ReadAppend; APlus; //Open file for reading and appending. The file is created if it does not exist.
//   ReadAppendExclusive; AXPlus; //Like 'a+' but opens the file in exclusive mode.
//   Custom(s:String);
// }


extern class Stats{
  public var dev:Int;
  public var ino:Int;
  public var mode:Int;
  public var nlink:Int;
  public var uid:Int;
  public var gid:Int;
  public var rdev:Int;
  public var size:Int;
  public var blksize:Int;
  public var blocks:Int;

  public var atime:Date;
  public var mtime:Date;
  public var ctime:Date;

  public function isFile():Bool;
  public function isDirectory():Bool;
  public function isBlockDevice():Bool;
  public function isCharacterDevice():Bool;
  public function isSymbolicLink():Bool; // only valid with fs.lstat()
  public function isFIFO():Bool;
  public function isSocket():Bool;
}

@:initPackage
extern class Fs{
  static function __init__():Void untyped Fs = Node.require('fs');

  public static function rename(oldPath:String, newPath:String, ?cb:CB):Void;
  public static function renameSync(oldPath:String, newPath:String):Void;
  public static function truncate(fd:FileDescriptor, len:Int, ?cb:CB):Void;
  public static function truncateSync(fd:FileDescriptor, len:Int):Void;
  public static function chown(path:String, uid:Int, gid:Int, ?cb:CB):Void;
  public static function chownSync(path:String, uid:Int, gid:Int):Void;
  public static function fchown(fd:FileDescriptor, uid:Int, gid:Int, ?cb:CB):Void;
  public static function fchownSync(fd:FileDescriptor, uid:Int, gid:Int):Void;
  public static function lchown(path:String, uid:Int, gid:Int, ?cb:CB):Void;
  public static function lchownSync(path:String, uid:Int, gid:Int):Void;
  public static function chmod(path:String, mode:Int, ?cb:CB):Void;
  public static function chmodSync(path:String, mode:Int):Void;
  public static function fchmod(fd:FileDescriptor, mode:Int, ?cb:CB):Void;
  public static function fchmodSync(fd:FileDescriptor, mode:Int):Void;
  public static function lchmod(path:String, mode:Int, ?cb:CB):Void;
  public static function lchmodSync(path:String, mode:Int):Void;
  public static function stat(path:String, ?cb:Dynamic->Stats->Void):Void;
  public static function lstat(path:String, ?cb:Dynamic->Stats->Void):Void;
  public static function fstat(fd:FileDescriptor, ?cb:Dynamic->Stats->Void):Void;
  public static function statSync(path:String):Stats;
  public static function lstatSync(path:String):Stats;
  public static function fstatSync(fd:FileDescriptor):Stats;
  public static function link(srcpath:String, dstpath:String, ?cb:CB):Void;
  public static function linkSync(srcpath:String, dstpath:String):Void;

  @:overload(function(srcpath:String, dstpath:String, type:String, ?cb:CB):Void{})
  @:overload(function(srcpath:String, dstpath:String, type:SymlinkType, ?cb:CB):Void{})
  public static function symlink(srcpath:String, dstpath:String, ?cb:CB):Void;
  @:overload(function(srcpath:String, dstpath:String, type:String):Void{})
  @:overload(function(srcpath:String, dstpath:String, type:SymlinkType):Void{})
  public static function symlinkSync(srcpath:String, dstpath:String):Void;

  public static function readlink(path:String, ?cb:Dynamic->String->Void):Void;
  public static function readlinkSync(path:String):String;
  @:overload(function (path:String, cache:Dynamic, cb:Dynamic->String->Void):Void{})
  public static function realpath(path:String, cb:Dynamic->String->Void):Void;
  public static function realpathSync(path:String, ?cache:Dynamic):String;
  public static function unlink(path:String, ?cb:CB):Void;
  public static function unlinkSync(path:String):Void;
  public static function rmdir(path:String, ?cb:CB):Void;
  public static function rmdirSync(path:String):Void;

  @:overload(function(path:String, mode:Int, ?cb:CB):Void{})
  public static function mkdir(path:String, ?cb:CB):Void;
  public static function mkdirSync(path:String, ?mode:Int):Void;

  public static function readdir(path:String, ?cb:Dynamic->Array<String>->Void):Void;
  public static function readdirSync(path:String):Array<String>;
  public static function close(fd:FileDescriptor, ?cb:CB):Void;
  public static function closeSync(fd:FileDescriptor):Void;

  @:overload(function(path:String, flags:String, ?mode:Int, ?cb:Dynamic->FileDescriptor->Void):Void{})
  public static function open(path:String, flags:FileOpenFlags, ?mode:Int, ?cb:Dynamic->FileDescriptor->Void):Void; //TODO
  public static function openSync(path:String, flags:FileOpenFlags, ?mode:Int):FileDescriptor;  //TODO

  public static function utimes(path:String, atime:Date, mtime:Date, ?cb:CB):Void;
  public static function utimesSync(path:String, atime:Date, mtime:Date):Void;
  public static function futimes(fd:FileDescriptor, atime:Date, mtime:Date, ?cb:CB):Void;
  public static function futimesSync(fd:FileDescriptor, atime:Date, mtime:Date):Void;
  public static function fsync(fd:FileDescriptor, ?cb:CB):Void;
  public static function fsyncSync(fd:FileDescriptor):Void;
  public static function write(fd:FileDescriptor, buffer:Buffer, offset:Int, length:Int, position:Int, ?cb:Dynamic->Int->Buffer->Void):Void;
  public static function writeSync(fd:FileDescriptor, buffer:Buffer, offset:Int, length:Int, position:Int):Int;
  public static function read(fd:FileDescriptor, buffer:Buffer, offset:Int, length:Int, position:Int, ?cb:Dynamic->Int->Buffer->Void):Void;
  public static function readSync(fd:FileDescriptor, buffer:Buffer, offset:Int, length:Int, position:Int):Int;

  @:overload(function(filename:String, encoding:String, cb:Dynamic->String->Void):Void{})
  public static function readFile(filename:String, cb:Dynamic->Buffer->Void):Void;

  @:overload(function(filename:String, encoding:String):String{})
  public static function readFileSync(filename:String):Buffer;


  @:overload(function(filename:String, data:String, encoding:String, ?cb:CB):Void{})
  public static function writeFile(filename:String, data:Buffer, ?cb:CB):Void;
  @:overload(function(filename:String, data:String, encoding:String):Void{})
  public static function writeFileSync(filename:String, data:Buffer):Void;


  @:overload(function(filename:String, data:String, encoding:String, ?cb:CB):Void{})
  public static function appendFile(filename:String, data:Buffer, ?cb:CB):Void;
  @:overload(function(filename:String, data:String, encoding:String):Void{})
  public static function appendFileSync(filename:String, data:Buffer):Void;

  //~ public static function watchFile(filename:String, ?options, listener)
  //~ public static function unwatchFile(filename:String, ?listener)

  public static function watch(filename:String, ?options:{persistent:Bool}, ?listener:String->String->Void):FSWatcher<Void>;

  public static function exists(path:String, cb:Bool->Void):Void;
  public static function existsSync(path:String):Bool;

  public static function createReadStream(path:String, ?options:ReadStreamOptions):ReadStream;
  public static function createWriteStream(path:String, ?options:WriteStreamOptions):WriteStream;

}

private typedef ReadStreamOptions = {
  ?flags: String,
  ?encoding: String,
  ?fd: FileDescriptor,
  ?mode: Int,
  ?bufferSize: Int,
};

private typedef WriteStreamOptions = {
  ?flags: String,
  ?encoding: String,
  ?mode: Int,
};


extern class ReadStream extends node.stream.ReadableImpl{
  public function hasEventOpen():Void;
}

extern class WriteStream extends node.stream.ReadableImpl{
  public function hasEventOpen():Void;
}

@:native('node.Fs.FSWatcher')
extern class FSWatcher<T> extends EventEmitter{
  // public function hasEventChange():Void;
  // public function hasEventError():Void;
  public function close():Void;
}
