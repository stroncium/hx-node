SRC = ../src/Node.hx ../src/*/*.hx
TESTSRC = TestOOP.hx

.PHONY: all src
all: event-emitter.test

oop.test: TestOOP.js
	node TestOOP.js && touch oop.test || rm -f oop.test

event-emitter.test: TestEventEmitter.js
	node TestEventEmitter.js  && touch event-emitter.test || rm -f event-emitter.test

TestEventEmitter.js: src TestEventEmitter.hx
	haxe -main TestEventEmitter -js TestEventEmitter.js -cp ../src

TestOOP.js: src TestOOP.hx
	haxe -main TestOOP -js TestOOP.js -cp ../src

src: $(SRC)

Makefile: ;
#$(SRC): ;
#$(TESTSRC): ;
*.hx: ;
