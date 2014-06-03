package node;

private typedef UrlObject = {
  ?href:String,
  ?protocol:String,
  ?host:String,
  ?auth:String,
  ?hostname:String,
  ?port:String,
  ?pathname:String,
  ?search:String,
  ?path:String,
  ?query:Dynamic,
  ?hash:String,
};

extern class Url implements Node.Module<'url', ''>{
  public static function parse(url:String, ?parseQueryString:Bool, ?slashesDenoteHost:Bool):UrlObject;
  public static function format(obj:UrlObject):String;
  public static function resolve(url:String, add:String):String;
}
