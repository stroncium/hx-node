package node;

private typedef CB = Dynamic->Void;
abstract FileDescriptor(Void){}

@:enum abstract SymlinkType(String) #if !debug from String #end{
  inline var Dir = 'dir';
  inline var File = 'file';
  inline var Junction = 'junction';

  #if debug
    static var allowedNames:Array<String> = 'dir|file|junction'.split('|');
    public function new(name:String){
      if(allowedNames.indexOf(name) == -1) throw 'Unkown symlink type: $name';
      this = name;
    }
  #end
}


@:enum abstract FileOpenFlags(String) #if !debug from String #end{
  inline var Read = 'r'; // Open file for reading. An exception occurs if the file does not exist.
  inline var ReadWrite = 'r+'; // Open file for reading and writing. An exception occurs if the file does not exist.
  inline var ReadSync = 'rs'; // Open file for reading in synchronous mode. Instructs the operating system to bypass the local file system cache.
  inline var ReadWriteSync = 'rs+'; // Open file for reading and writing, telling the OS to open it synchronously. See notes for 'rs' about using this with caution.
  inline var Write = 'w'; // Open file for writing. The file is created (if it does not exist) or truncated (if it exists).
  inline var WriteExclusive = 'wx'; // Like 'w' but opens the file in exclusive mode.
  inline var WriteRead = 'w+'; // Open file for reading and writing. The file is created (if it does not exist) or truncated (if it exists).
  inline var WriteReadExclusive = 'wx+'; // Like 'w+' but opens the file in exclusive mode.
  inline var Append = 'a'; // Open file for appending. The file is created if it does not exist.
  inline var AppendExclusive = 'ax'; // Like 'a' but opens the file in exclusive mode.
  inline var ReadAppend = 'a+'; // Open file for reading and appending. The file is created if it does not exist.
  inline var ReadAppendExclusive = 'ax+'; // Like 'a+' but opens the file in exclusive mode.

  #if debug
    static var allowedNames:Array<String> = 'r|r+|rs|rs+|w|wx|w+|wx+|a|ax|a+|ax+'.split('|');
    public function new(name:String){
      if(allowedNames.indexOf(name) == -1) throw 'Unkown symlink type: $name';
      this = name;
    }
  #end

}


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

extern class Fs implements Node.Module<'fs', ''>{
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
  public static function link(src:String, dst:String, ?cb:CB):Void;
  public static function linkSync(src:String, dst:String):Void;
  public static function symlink(src:String, dst:String, ?type:SymlinkType, ?cb:CB):Void;
  public static function symlinkSync(src:String, dst:String, ?type:SymlinkType):Void;
  public static function readlink(path:String, ?cb:Dynamic->String->Void):Void;
  public static function readlinkSync(path:String):String;
  public static function realpath(path:String, ?cache:js.Object, cb:Dynamic->String->Void):Void;
  public static function realpathSync(path:String, ?cache:js.Object):String;
  public static function unlink(path:String, ?cb:CB):Void;
  public static function unlinkSync(path:String):Void;
  public static function rmdir(path:String, ?cb:CB):Void;
  public static function rmdirSync(path:String):Void;
  public static function mkdir(path:String, ?mode:Int = 0x777, ?cb:CB):Void;
  public static function mkdirSync(path:String, ?mode:Int = 0x777):Void;
  public static function readdir(path:String, ?cb:Dynamic->Array<String>->Void):Void;
  public static function readdirSync(path:String):Array<String>;
  public static function close(fd:FileDescriptor, ?cb:CB):Void;
  public static function closeSync(fd:FileDescriptor):Void;
  public static function open(path:String, flags:FileOpenFlags, ?mode:Int, ?cb:Dynamic->FileDescriptor->Void):Void;
  public static function openSync(path:String, flags:FileOpenFlags, ?mode:Int):FileDescriptor;

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

  @:overload(function(filename:String, enc:Encoding, cb:Dynamic->String->Void):Void{})
  public static function readFile(filename:String, cb:Dynamic->Buffer->Void):Void;

  @:overload(function(filename:String, enc:Encoding):String{})
  public static function readFileSync(filename:String):Buffer;


  @:overload(function(filename:String, data:String, enc:Encoding, ?cb:CB):Void{})
  public static function writeFile(filename:String, data:Buffer, ?cb:CB):Void;
  @:overload(function(filename:String, data:String, enc:Encoding):Void{})
  public static function writeFileSync(filename:String, data:Buffer):Void;


  @:overload(function(filename:String, data:String, enc:Encoding, ?cb:CB):Void{})
  public static function appendFile(filename:String, data:Buffer, ?cb:CB):Void;
  @:overload(function(filename:String, data:String, enc:Encoding):Void{})
  public static function appendFileSync(filename:String, data:Buffer):Void;

  //~ public static function watchFile(filename:String, ?options, listener)
  //~ public static function unwatchFile(filename:String, ?listener)

  public static function watch(filename:String, ?options:{persistent:Bool}, ?listener:String->String->Void):FSWatcher;

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
  // public function hasEventOpen():Void;
}

extern class WriteStream extends node.stream.ReadableImpl{
  // public function hasEventOpen():Void;
}

// Real class is not reachable in node.js
extern class FSWatcher extends EventEmitter{
  // public function hasEventChange():Void;
  // public function hasEventError():Void;
  public function close():Void;
}
