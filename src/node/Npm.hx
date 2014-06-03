package node;
import haxe.macro.Type;
import haxe.macro.Context;
import haxe.macro.Compiler;
import neko.Lib;
import sys.FileSystem;
import sys.io.File;


class Npm{
#if macro
  static var packName:String;
  static var packVersion:String;
  // static var packPath:String;
  static inline var NPM_MODULE_META_NAME = ':npmModule';

  public static function genPackage(name:String, version:String){
    if(!~/^[a-zA-Z][a-zA-Z0-9_.-]*$/.match(name)) Context.error('Name "$name" is not allowed as npm package name', Context.currentPos());
    packName = name;
    // packPath = path;
    packVersion = version;
    haxe.macro.Context.onGenerate(reallyGeneratePackage);
  }

  static function archiveFile(path:String){
    var i = 0;
    var oldPath = '$path.old';
    while(FileSystem.exists(oldPath)){
      i++;
      oldPath = '$path.old.$i';
    }
    FileSystem.rename(path, oldPath);
    return oldPath;
  }

  static function reallyGeneratePackage(types:Array<Type>){
    var deps = {}
    for(t in types) switch(t){
      case TInst(clr, _):
        var cl = clr.get();
        if(cl.meta.has(NPM_MODULE_META_NAME)){
          var ms = cl.meta.get();
          for(m in ms) if(m.name == NPM_MODULE_META_NAME){
            if(m.params.length != 2) Context.error('@:$NPM_MODULE_META_NAME requires 2 String arguments', m.pos);
            var mod = switch(m.params[0].expr){
              case EConst(CString(v)): v;
              case _: Context.error('@:$NPM_MODULE_META_NAME requires 2 String arguments', m.pos);
            }
            var ver = switch(m.params[1].expr){
              case EConst(CString(v)): v;
              case _: Context.error('@:$NPM_MODULE_META_NAME requires 2 String arguments', m.pos);
            }
            cl.meta.add(':jsRequire', [m.params[0]], m.pos);
            Reflect.setField(deps, mod, ver);
          }
        }
      case _:
    }
    // Lib.println('Generating package.json for $packName');

    var output = Compiler.getOutput().split('/');
    var folder, file;
    if(output.length == 1){
      file = output[0];
      folder = '.';
    }
    else{
      folder = output.slice(0, -1).join('/');
      file = output[output.length-1];
    }
    var packPath = '$folder/package.json';

    // trace('output: $output');
    var data = {
      name: packName,
      version: packVersion,
      dependencies: deps,
      scripts: {
        start: 'node $file',
        run: 'node $file',
      }
    };
    if(FileSystem.exists(packPath)){
      var oldTxt = File.getContent(packPath);
      try{
        var json = haxe.Json.parse(oldTxt);
        for(f in Reflect.fields(data)) Reflect.setField(json, f, Reflect.field(data, f));
        data = json;
      }
      catch(e:Dynamic){
        Context.warning('"$packPath" is unparseable, ignoring.', Context.currentPos());
      }

      var newTxt = haxe.Json.stringify(data);
      if(newTxt != oldTxt){
        var oldPath = archiveFile(packPath);
        Context.warning('"$packPath" exists, saving as "$oldPath"', Context.currentPos());
        File.saveContent(packPath, newTxt);
      }
    }
    else{
      File.saveContent(packPath, haxe.Json.stringify(data));
    }
  }
#end
}
