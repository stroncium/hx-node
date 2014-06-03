import Node;

import js.Object;

import node.Dns;
import node.Assert;
import node.Buffer;
import node.ChildProcess;
import node.Cluster;
import node.Console;
import node.Crypto;
import node.Domain;
import node.EventEmitter;
import node.Fs;
import node.Http;
import node.Https;
import node.Os;
import node.Path;
import node.Process;
import node.Punycode;
import node.QueryString;
import node.Readline;
import node.Repl;
import node.StringDecoder;
import node.Tls;
import node.Tty;
import node.Udp;
import node.Url;
import node.Util;
import node.Zlib;
import node.Net;
import node.stream.Writable;
import node.stream.Readable;
import node.stream.Duplex;
import node.stream.WritableImpl;
import node.stream.ReadableImpl;
import node.stream.DuplexImpl;
import node.Encoding;

class T1 extends ReadableImpl implements I{
  override public function _read(size){
    push('1');
  }
}

interface I{}

class TestOOP{
  public static function main(){
    trace('All classes initialized');

    var t1 = new T1();
    assert(Std.is(t1, T1));
    assert(Std.is(t1, ReadableImpl));
    assert(Std.is(t1, Readable));
    assert(Std.is(t1, I));

    trace('TestOOP done');
  }

  static function assert(v:Bool, ?msg = 'Assertion failed'){
    if(!v) throw msg;
  }
}
