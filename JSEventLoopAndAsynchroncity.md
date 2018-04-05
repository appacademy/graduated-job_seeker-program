JavaScript Event Loop and Asynchronicity
=======


### Resources:

  * 🎥 ["What the heck is the event loop anyway?"](https://chromium.googlesource.com/chromium/src/+/lkcr/docs/threading_and_tasks.md#Overview)
  (an oldie but a goodie)
  * 📖 [Asynchronous Adventures in JavaScript]( https://medium.com/dailyjs/asynchronous-adventures-in-javascript-understanding-the-event-loop-fc6f968d5f72)
  * 📖 [Overview of the Engine, Runtime, and the Call Stack]( https://blog.sessionstack.com/how-does-javascript-actually-work-part-1-b0bacc073cf)
---
## How do we talk about JavaScript?

There is often a lot of confusion surrounding how to talk about JavaScript.
There are many opinions, ideas, and misconceptions about the pieces that make
up the JavaScript we use and how they all tie together.  The resources below have been collected
to help us better understand what JavaScript is (and isn't) so that we can speak
confidently and knowledgeably about JS as software engineers.

#### JavaScript

JavaScript is a high level interpreted programming language.  It can be characterized
by the following terms:

* Dynamic (it can execute many common behaviors at runtime rather than having to be compiled)
* Weakly Typed (types are not declared or firmly adhered to making things like type coercion possible)
* Prototype-Based (OOP style based on sharing behavior through objects or 'prototypes')
* Multi-paradigm (permits the use of different programming paradigms)
* Single-threaded (it can only execute one action at any given time)
* Concurrent(capable of delegating multiple tasks simultaneously)*

  _*NB: Although this seems contrary to JS being single threaded, concurrency is achieved by relying
  on the host environment to execute certain tasks and then organizing the return values/callbacks of those tasks back into
  JavaScript's single thread through the Event Loop._

**What about ECMAScript?**
ECMAScript is the standardized specification that forms the basis for JavaScript.
Think of it as a blueprint from which various JavaScript engines, such as
Chrome's V8, are built. From 2009-2015, the most recent _stable_ version of
ECMAScript was ECMAScript 5, or ES5 for short.  Additionally, ECMAScript 6 & 7
have been released, but browser support for these versions is not yet standard.
