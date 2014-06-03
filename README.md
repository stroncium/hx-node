hx-node
=======

Better haxe bindings for node.js.



Why better?
===========
Because everything possible is typed.
=====================================

 1. Typed EventEmitters.
    Right, compile time checking on EventEmitters with meta event type declarations.

 2. Encoding, Strings and Buffers
    No more mistakes with that, everything is typed, node.Encoding is an enum.

 3. Every possible enum of node.js base api is typed.

 4. Uses modern(currently on git) @:jsRequire meta for clear code.

 5. Everything is updated to match haxe OOP structure. Std.is actually works on everything(possible).

 6. NPM support.
    @:npmModule('name', 'version') meta will auto-require module for you.
    node.Npm.genPackage(name:String, version:String) will generate or update package.json with your dependencies.

 7. stream.Writable, stream.Readable, stream.Duplex are iterfaces now.

    ...but each one have it's <name>Impl class for your disposal. Yet again, everything in proper OOP.

 8. Support node.js builtin variables, everything hosted in Node class.

 8. Structured as close to original API as possible.
    Everything(except class Node) moved to namespace node. Classesrenamed according to haxe class naming principles.


What's missing?
===============

 1. Documentation. Though the structure resembles node.js API as much as possible, and everything else is auto-documented.

 2. Compatible bindings to common node modules. Yet they are soon to come.

 3. Testing.
    Last part of development introduced some major changes so there may be slight poblems around the code. If they are really there they will be fixed soon.



