package node;

import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.Context;

class Macros{
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
