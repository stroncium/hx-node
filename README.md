hx-node
=======

Better haxe bindings for node.js. Type the world!



Why better?
===========
Because everything possible is typed.
=====================================

 1. Typed `EventEmitter`s.
    Right, compile time checking on `EventEmitter`s with meta event type declarations.

 2. `Encoding`, `String`s and `Buffer`s
    No more mistakes with that, everything is typed, `node.Encoding` is an enum.

 3. Every possible enum of node.js base api is typed.

 4. Uses modern(currently on git) `@:jsRequire` meta for clear code and proper requires.
    No need to require anything by hand. Implement `Node.Module<name, vesrions>` and be happy. Implement `node.ModuleSub<name, version, subname>` to get something out of require module.

 5. Everything is updated to match haxe OOP structure. `Std.is` actually works on everything(possible).

 6. NPM support.
    Implement `Node.Module<name, version>` with `version != ''` to register npm dependency. Run `node.Npm.genPackage(name:String, version:String)` to generate or update package.json at the same directory you generate your js in with dependencies registered through implementing Node.Module.

 7. stream.Writable, stream.Readable, stream.Duplex are iterfaces now.
    ...but each one have it's <name>Impl class for your disposal. Yet again, everything in proper OOP.

 8. Support node.js builtin variables, all hosted in Node class.
    process, as a special case, not only is in Node class, but have a complex declaration in node.Process, enriched with fake variables, getters and setters to simplify workflow.

 8. Structured as close to original API as possible.
    Everything(except class Node) moved to namespace node. Classes renamed according to haxe class naming principles, but it takes no time to adapt.


What's missing?
===============

 1. Documentation. Though the structure resembles node.js API as much as possible, and everything else is auto-documented.

 2. Compatible bindings to common node modules. Yet they are soon to come.

 3. Testing.
    Last part of development introduced some major changes so there may be slight poblems around the code. If they are really there they will be fixed soon.



