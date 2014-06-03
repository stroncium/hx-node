package node;

import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.Context;

class Macros{
  public static var usedModules:Map<String, String> = new Map();

  static function __init__(){
    Context.onMacroContextReused(reuse);
  }

  static function reuse(){
    usedModules = new Map();
    return true;
  }

  static function macroModule(sub:Bool){
    var cl = Context.getLocalClass().get();
    var consts = getInterfaceConstants(cl, 'Node', [], sub ? 'ModuleSub' : 'Module');
    var mod = consts[0], ver = consts[1], subname = consts[2];
    if(consts == null) throw 'macroModule($sub) called on something not implementing Node.${sub?"ModuleSub":"Module"}';
    var reqArgs = sub ? [macro $v{mod}, macro $v{subname}] : [macro $v{mod}];
    cl.meta.add(':jsRequire', reqArgs, Context.currentPos());
    var pver = usedModules[mod];
    if(pver != null && pver != ver) Context.error('Reusing same Node.js module "$mod" with different versions "$ver" and "$pver"', Context.currentPos());
    usedModules[mod] = ver;
    return Context.getBuildFields();
  }

  static function getInterfaceConstants(cl:ClassType, module:String, pack:Array<String>, name:String){
    for(ifacet in cl.interfaces){
      var iface = ifacet.t.get();
      if(iface.name != name || iface.module != module || iface.pack.length != pack.length) continue;
      var packEq = true;
      for(i in 0...pack.length) if(iface.pack[i] != pack[i]){
        packEq = false;
        break;
      }
      if(!packEq) continue;
      return [for(p in ifacet.params) switch(p){
        case TInst(clr, _): clr.get().name.substr(1);
        case _: throw 'unexpected';
      }];
    }
    return null;
  }
}
