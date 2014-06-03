SRC = ../src/ ../src/Node.hx ../src/node ../src/node/StringDecoder.hx ../src/node/Path.hx ../src/node/EventEmitter.hx ../src/node/Assert.hx ../src/node/Http.hx ../src/node/Domain.hx ../src/node/Encoding.hx ../src/node/Https.hx ../src/node/stream ../src/node/stream/Writable.hx ../src/node/stream/ReadableImpl.hx ../src/node/stream/DuplexImpl.hx ../src/node/stream/Readable.hx ../src/node/stream/Duplex.hx ../src/node/stream/WritableImpl.hx ../src/node/Process.hx ../src/node/events ../src/node/events/EventEmitter.hx ../src/node/events/EventEmitterMacro.hx ../src/node/Repl.hx ../src/node/Net.hx ../src/node/Tls.hx ../src/node/Tty.hx ../src/node/ChildProcess.hx ../src/node/Util.hx ../src/node/Zlib.hx ../src/node/Fs.hx ../src/node/Readline.hx ../src/node/Udp.hx ../src/node/QueryString.hx ../src/node/Cluster.hx ../src/node/Ffi.hx ../src/node/Punycode.hx ../src/node/Buffer.hx ../src/node/Os.hx ../src/node/Crypto.hx ../src/node/Url.hx ../src/node/Dns.hx ../src/node/Console.hx ../src/js ../src/js/Object.hx
TESTSRC = TestOOP.hx

.PHONY: all
all: oop

.PHONY: src
src: $(SRC)

oop: TestOOP.js
	node TestOOP.js

TestOOP.js: src TestOOP.hx
	haxe -main TestOOP -js TestOOP.js -cp ../src

Makefile: ;
$(SRC): ;
$(TESTSRC): ;
