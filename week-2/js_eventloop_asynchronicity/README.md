JavaScript Event Loop and Asynchronicity
=======


### Resources:

  * 🎥 ["What the heck is the event loop anyway?"](https://www.youtube.com/watch?v=8aGhZQkoFbQ)
  (an oldie but a goodie)
  * 📖 [Asynchronous Adventures in JavaScript]( https://medium.com/dailyjs/asynchronous-adventures-in-javascript-understanding-the-event-loop-fc6f968d5f72)
  * 📖 [Overview of the Engine, Runtime, and the Call Stack]( https://blog.sessionstack.com/how-does-javascript-actually-work-part-1-b0bacc073cf)
  * 📖 [Event Loop and Async Programming](https://blog.sessionstack.com/how-javascript-works-event-loop-and-the-rise-of-async-programming-5-ways-to-better-coding-with-2f077c4438b5)
  * 📖 [JavaScript Closures with Ease](http://javascriptissexy.com/understand-javascript-closures-with-ease/)
  * 📖 [Parallel vs Concurrent](https://bytearcher.com/articles/parallel-vs-concurrent/)
  * 📖 [Hoisting from MDN](https://developer.mozilla.org/en-US/docs/Glossary/Hoisting)

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
* **Concurrent** (capable of delegating multiple tasks simultaneously)*
* **Never Blocking** (I/O does not interfere with user input and activity)

  ****NB***: _Although this seems contrary to JS being single threaded, concurrency is achieved by relying
  on the host environment to execute certain tasks and then organizing the return values/callbacks of those tasks back into
  JavaScript's single thread via the Event Loop._

**What about ECMAScript?**
ECMAScript is the standardized specification that forms the basis for JavaScript.
Think of it as a blueprint from which various JavaScript engines, such as
Chrome's V8, are built. From 2009-2015, the most recent _stable_ version of
ECMAScript was ECMAScript 6, or ES6 for short.  Additionally, ECMAScript 7
has been released, but browser support is not yet standard.

### Parallel vs Concurrent
JavaScript is able to run operations concurrently through the Event Loop. **Concurrency** means that processes can run independently of one another, but they do not necessarily run at the same time. (JS is single threaded, so only one process can ever execute at a time.)  Concurrent processes can actually be paused so that other processes can be executed. **Parallelism** means that multiple processes can run at exactly the same time.  Parallel environments can be described as concurrent, but not all concurrent environments are parallel.  Ex:

**Concurrent**:

<img src='https://bytearcher.com/articles/parallel-vs-concurrent/concurrent-2.png' style='width: 200px'>

**Parallel**:

<img src='https://bytearcher.com/articles/parallel-vs-concurrent/parallel-2.png' style='width: 200px'>

### JavaScript Engine and JavaScript Runtime environment

The JavaScript Engine and the Runtime Environment are the two things that make up how we use JavaScript.  

**The Engine** interprets your JS code and turns it into runnable commands.  Examples include V8 (Google), Chakra (Microsoft), and SpiderMonkey (Mozilla). It is made up of the **Heap** for memory allocation, and the **Call Stack** for execution of code.

**The Runtime Environment** supports your JavaScript by providing it with common objects and ways to communicate with the world outside your code.  Examples include the web browser and Node.js. It provides your **APIs**, such as setTimeout() and AJAX requests, the **Task/Callback Queue** for organizing executable tasks, and the **Event Loop** to feed tasks from the queue into the call stack.


<img src='https://cdn-images-1.medium.com/max/800/1*FA9NGxNB6-v1oI2qGEtlRQ.png' style='width: 600px'>

### Environment APIs, the Task Queue, and the Event Loop

The APIs provided by the runtime environment are what make JavaScript asynchronous. Normal JS code is synchronous, executing one command at a time in order.  Environment APIs however do not need to be executed one at a time or wait for one another. The environment is able to allocate resources, or threads, to multiple tasks simultaneously (either in parallel or concurrently depending on the environment and your hardware).  

When an API task is complete, such as an event is triggered or a timer has finished, the callback to be executed on completion (ie: when the Promise is resolved. _See below for more info on Promises_) is placed in the task queue and waits to be added to the call stack.  

The event loop is in charge of cyclically monitoring the call stack and the task queue. It will watch the call stack until all synchronous commands have been executed and the stack is empty.  Once the stack is empty, the Event loop will look at the task queue, remove the first item from the queue (if there are any), and then place that task onto the call stack to execute.  This gif shows the process in action:

<img src='https://cdn-images-1.medium.com/max/800/1*TozSrkk92l8ho6d8JxqF_w.gif' style='width: 600px'>

You can read more about the different phases of the Node.js event loop here: [Walking Inside the Node.js Event Loop](https://medium.freecodecamp.org/walking-inside-nodejs-event-loop-85caeca391a9)

And, here is a list of [Web APIs on MDN](https://developer.mozilla.org/en-US/docs/Web/API) for some context on how many different things the runtime environment can do.


### Closures

The quick and concise definition is as follows:

_'A closure is an inner function that has access to the outer (enclosing) function’s variables—scope chain.'_

Another way to describe closures is when a function 'closes over' a variable or parameter from the global scope, it's parent function's scope, it's parent function's parameters, or it's internal variables, and then maintains a reference to that information regardless of the function's context.


In this example, ```addNum``` closes over ```count``` and maintains that reference when it is called.  It is also worth noting that closure is what allows ```addNum``` to be passed ```nums``` in the for loop.
```javascript
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

### Callbacks

A callback function is a function passed into another function as an argument, which is then invoked inside the outer function to complete some kind of routine or action.

Example:

```javascript
function greeting(name) {
  alert('Hello ' + name);
}

function processUserInput(callback) {
  var name = prompt('Please enter your name.');
  callback(name);
}

processUserInput(greeting);

```
It's important to note that the above is an example of a synchronous callback. The function is executed immediately; it does not wait for any asynchronous actions.

### Promises
In JavaScript a Promise object represents the eventual completion (or failure) of an asynchronous operation, and its resulting value.  Promises are what we can attach and chain callbacks to to be executed on success or failure.

Check out the [MDN docs on using promises](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Using_promises)  for a great practical look at typical promise use.

**Promise.all()**

```Promise.all()``` is a very powerful way to monitor multiple promises running concurrently and then execute some command only after all the promises are resolved.  

```Promise.all()``` takes an iterable (typically an array of asynchronous functions) as an argument.

```javascript
const promise1 = Promise.resolve(3);
const promise2 = 42;
const promise3 = new Promise(function(resolve, reject) {
  setTimeout(resolve, 100, 'foo');
});

Promise.all([promise1, promise2, promise3]).then(function(values) {
  console.log(values);
});

```

In the above case, ```values``` is what the promise object passes to the callback argument to ```.then()```.  ```values``` is an array of the return values of all the asynchronous functions in the same order as those functions.  So, after all three asynchronous functions resolve, we would expect the return value to be:

```javascript
Promise.all([promise1, promise2, promise3]).then(function(values) {
  console.log(values);
});

// #=>  [3, 42, 'foo']
```
```Promise.all()``` is a very powerful tool that can make organizing the functionality of your program much easier.  Read more on [MDN for Promise.all(). ](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all)

### Asynchronicity

First off, a quick refresher: [JavaScript for Beginners: Async](https://rowanmanning.com/posts/javascript-for-beginners-async/)

At the end of the day, asynchronicity, or async, in JavaScript, is how we delegate relatively time intensive code so it does not interfere with our UI and UX.  The concurrency we discussed above is how JavaScript achieves async.

As of ECMAScript2017, we now have two very useful tools for declaring async operations in our code:  ```async``` and ```await```.

**Async**

```async``` is used at the definition of a function to declare it as asynchronous.  Ex:

```javascript
function resolveAfter2Seconds() {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('resolved');
    }, 2000);
  });
}

async function asyncCall() {
  console.log('calling');
  var result = await resolveAfter2Seconds();
  console.log(result);
  // expected output: "resolved"
}

```

```async``` let's the runtime environment executing the code know that this function should be handled asynchronously and set's it processing aside like it would any other asynchronous action. **The most important thing to remember when using async is that it returns a Promise**.

  ****NB***: _It's important to note that the function_ ```resolveAfter2seconds()``` _is still utilizing the Runtime Environment APIs.  These APIs could be replaced with anything, but should be reserved for typically asynchronous operations or extremely demanding computational tasks._

**Await**

Take a look at the code above again.  You'll notice that ```await``` is used on the assignment of the variable ```result```.  ```await```'s job is to pause the synchronous code being executed and wait for the asynchronous or time consuming code to finish before continuing.  

**!!! Await is not the same as Promise.all() !!!**

This is a very important distinction.  ```Promise.all``` will execute it's async code concurrently so that as soon as all operations are done, it returns.  ```await``` will actually pause all other execution of code until it receives the return value of whatever operation it is waiting for (be it asynchronous or just time consuming).  Successive ```await``` calls will pause at each ```await```.

**When to use async/await**

The main purpose of async/await is to make writing and utilizing Promises simpler.  See the example below:

```javascript
function getProcessedData(url) {
  return downloadData(url) // returns a promise
    .catch(e => {
      return downloadFallbackData(url)  // returns a promise
    })
    .then(v => {
      return processDataInWorker(v); // returns a promise
    });
}
```

can be rewritten into a much simpler single function:

```javascript
async function getProcessedData(url) {
  let v;
  try {
    v = await downloadData(url);
  } catch(e) {
    v = await downloadFallbackData(url);
  }
  return processDataInWorker(v);
}
```

both are completely valid and usable blocks of code, but the async/await version is shorter and cleaner. [Read more about usage and syntax on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function).

```async/await``` is not the perfect solution for every problem, but it is another valuable tool to have when you are building the functionality of your JavaScript code.

### Hoisting:

Hoisting is JavaScript's default behavior of moving all _declarations_ (not initializations or assignments) to the top of the current scope (ie: current script or function).  

#### Functions

Function declarations are hoisted with their signatures to the top of their scope, making them immediately available to use before their definitions in your script:

```JavaScript
catName("Chloe");

function catName(name) {
  console.log("My cat's name is " + name);
}
/*
The result of the code above is: "My cat's name is Chloe"
*/

```

This, however, is only true for function declarations. Function expressions are **NOT** hoisted.

```JavaScript
catName("Chloe");

var catName = function(name) {
  console.log("My cat's name is " + name);
}
/*
The result of the code above is: Uncaught TypeError: catName is not a function"
*/

```




#### Variables
Variable declarations are hoisted to the top of their scope, but they remain undefined until they are assigned:

```JavaScript
console.log(num); // Prints undefined
var num;
num = 6;

```

```JavaScript
num = 6;
console.log(num); // Prints 6
var num;

```

The first example prints undefined because even though we have access to the variable because it has been hoisted to the top of the scope, the variable has not been initialized/assigned when we invoke console.log. Variables remain undefined until they are assigned in our scripts.

The second example works as expected because even though the variable is declared beneath the invocation of console.log, that declaration is hoisted to the top of the scope.  The variable is then assigned before it is passed to console.log.

#### ```var```, ```let```, and ```const```

```var```, ```let```, and ```const``` are all hoisted in JavaScript, but there are two key differences in their behavior:
* ```var``` is globally scoped to its' lexical environment.  This means it is hoisted to the top of (and accessible to) anything within the scope in which it was declared (globally, the function, etc.). ```let``` and ```const``` are block scoped. They are only hoisted to the top of the block in which they are defined.

* A variable declared with ```var``` will return ```undefined``` if you attempt to use it before it has been assigned/initialized.  ```let``` and ```const``` variables are designed to throw an error if you attempt to use them before they are assigned/initialized (making it much easier and safer to debug).

_**NB:**_ Always default to using ```const```.  If you learn later that you need your variable to change/update, switch it to a ```let```.  If for whatever reason that doesn't work for you, then move on to a ```var```, but, if everything is scoped properly, you shouldn't need to.  


### Currying

Named after Haskell Brooks Curry, currying is the process of breaking down a function into a series of functions that each take a single argument.

This is the non-curried version of a function ```sum3``` that takes in three numbers and returns the sum of those numbers:
```JavaScript
function sum3(x, y, z) {
  return x + y + z;
}
console.log(sum3(1, 2, 3) // 6

```

and here is the curried version:

```JavaScript
function sum3(x) {
  return (y) => {
    return (z) => {
      return x + y + z;
    };
  };
}
console.log(sum3(1)(2)(3)) // 6

```

Although this tool might be difficult to think about practically, we've actually been using currying whenever we make container components using React and Redux!

```JavaScript
export default connect(mapStateToProps)(TodoApp)

```
