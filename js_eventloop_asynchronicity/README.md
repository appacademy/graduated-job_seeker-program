JavaScript Event Loop and Asynchronicity
=======


### Resources:

  * 🎥 ["What the heck is the event loop anyway?"](https://chromium.googlesource.com/chromium/src/+/lkcr/docs/threading_and_tasks.md#Overview)
  (an oldie but a goodie)
  * 📖 [Asynchronous Adventures in JavaScript]( https://medium.com/dailyjs/asynchronous-adventures-in-javascript-understanding-the-event-loop-fc6f968d5f72)
  * 📖 [Overview of the Engine, Runtime, and the Call Stack]( https://blog.sessionstack.com/how-does-javascript-actually-work-part-1-b0bacc073cf)
  * 📖 [Event Loop and Async Programming](https://blog.sessionstack.com/how-javascript-works-event-loop-and-the-rise-of-async-programming-5-ways-to-better-coding-with-2f077c4438b5)
  * 📖 [JavaScript Closures with Ease](http://javascriptissexy.com/understand-javascript-closures-with-ease/)
  * 📖 [Parallel vs Concurrent](https://bytearcher.com/articles/parallel-vs-concurrent/)
---
## How do we talk about JavaScript?

There is often a lot of confusion surrounding how to talk about JavaScript.
There are many opinions, ideas, and misconceptions about the pieces that make
up the JavaScript we use and how they all tie together.  Today's goal is to better understand
what JavaScript is (and isn't) so that we can speak confidently and knowledgeably
about JS as software engineers.

### JavaScript

JavaScript is a high level interpreted programming language.  It can be characterized
by the following terms:

* **Dynamic** (it can execute many common behaviors at runtime rather than having to be compiled)
* **Weakly Typed** (types are not declared or firmly adhered to making things like type coercion possible)
* **Prototype-Based** (OOP style based on sharing behavior through objects or 'prototypes')
* **Multi-paradigm** (permits the use of different programming paradigms)
* **Single-threaded** (it can only execute one action at any given time)
* **Concurrent**(capable of delegating multiple tasks simultaneously)*
* **Never Blocking** (I/O does not interfere with user input and activity)

  * **NB**: _Although this seems contrary to JS being single threaded, concurrency is achieved by relying
  on the host environment to execute certain tasks and then organizing the return values/callbacks of those tasks back into
  JavaScript's single thread via the Event Loop._

**What about ECMAScript?**
ECMAScript is the standardized specification that forms the basis for JavaScript.
Think of it as a blueprint from which various JavaScript engines, such as
Chrome's V8, are built. From 2009-2015, the most recent _stable_ version of
ECMAScript was ECMAScript 5, or ES5 for short.  Additionally, ECMAScript 6 & 7
have been released, but browser support for these versions is not yet standard.

### Parallel vs Concurrent
JavaScript is able to run operations concurrently through the Event Loop. **Concurrency** means that processes can run independently of one another, but they do not necessarily run at the same time. (JS is single threaded, so only one process can ever execute at a time.)  Concurrent processes can actually be paused so that other processes can be executed. **Parallelism** means that multiple processes can run at exactly the same time.  Parallel environments can be described as concurrent, but not all concurrent environments are parallel.  Ex:

**Concurrent**:

<img src='https://bytearcher.com/articles/parallel-vs-concurrent/concurrent-2.png' style='width: 200px'>

**Parallel**:

<img src='https://bytearcher.com/articles/parallel-vs-concurrent/parallel-2.png' style='width: 200px'>

### JavaScript Engine and JavaScript Runtime environment

The JavaScript Engine and the Runtime Environment are the two things that make up how we use JavaScript.  

**The Engine** interprets your JS code and turns it into runnable commands.  Examples include V8(Google), Chakra(Microsoft), and SpiderMonkey(Mozilla). It is made up of the **Heap** for memory allocation, and the **Call Stack** for execution of code.

**The Runtime Environment** supports your JavaScript by providing it with common objects and ways to communicate with the world outside your code.  Examples include the web browser and Node.js. It provides your **APIs**, such as setTimeout() and AJAX requests, the **Task/Callback Queue** for organizing executable tasks, and the **Event Loop** to feed tasks from the queue into the call stack.


<img src='https://cdn-images-1.medium.com/max/800/1*FA9NGxNB6-v1oI2qGEtlRQ.png' style='width: 600px'>

### Environment APIs, the Task Queue, and the Event Loop

The APIs provided by the runtime environment are what make JavaScript asynchronous. Normal JS code is synchronous, executing one command at a time in order.  Environment APIs however do not need to be executed one at a time or wait for one another. The environment is able allocate resources, or threads, to multiple tasks simultaneously (either in parallel or concurrently depending on the environment and your hardware).  

When an API task is complete, such as an event is triggered or a timer has finished, the callback applied to be executed on completion is placed in the task queue and waits to be added to the call stack.  

The event loop is in charge of cyclically monitoring the call stack and the task queue. It will watch the call stack until all synchronous commands have been executed and the stack is empty.  Once the stack is empty, the Event loop will look at the task queue, remove the first item from the queue (if there are any), and then place that task onto the call stack to execute.  This gif shows the process in action:

<img src='https://cdn-images-1.medium.com/max/800/1*TozSrkk92l8ho6d8JxqF_w.gif' style='width: 600px'>

You can read more about the different phases of the Node.js event loop here: [Walking Inside the Node.js Event Loop](https://medium.freecodecamp.org/walking-inside-nodejs-event-loop-85caeca391a9)

### Closures

The quick and concise definition is as follows:

_'A closure is an inner function that has access to the outer (enclosing) function’s variables—scope chain.'_

Another way to describe closures is when a function 'closes over' a variable or parameter from the global scope, it's parent function's scope, it's parent function's parameters, or it's internal variables, and then maintains a reference to that information regardless of the function's context.


In this example, ```addNum``` closes over ```count``` and maintains that reference when it is called.  It is also worth noting that closure is what allows ```addNum``` to be passed ```nums``` in the for loop.
```
function sum(nums) {
  let count = 0;

  function addNum(num) {
    count += num;
  }

  for (let i = 0; i < nums.length; i++){
    addNum(nums[i]);
  }

  return count;
}

sum([1, 3, 5]) // => 9
```


Refer to the app/Academy curriculum readings for more examples: [Closure and Scope](https://github.com/appacademy/curriculum/blob/master/javascript/readings/closures.md)

### Promises
In JavaScript a Promise object represents the eventual completion (or failure) of an asynchronous operation, and its resulting value.