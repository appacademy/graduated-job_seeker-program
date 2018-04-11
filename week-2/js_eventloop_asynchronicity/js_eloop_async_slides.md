#Wat!?

[![alt text](http://img.youtube.com/vi/rkg8q2b4TT4/0.jpg)](https://www.youtube.com/watch?v=ryJSRZzAvUs&t=12s)

---

# Let's talk about JavaScript!

---

# Today's Topics
- What JavaScript is
- The pieces that make up JavaScript
- Asynchronicity in JavaScript

---

#What is JavaScript?

### How do we describe JavaScript?

---

## JAvaScript is
a high level interpreted programming language. It is:

* Dynamic

* Weakly Typed

* Prototype-Based

* Multi-paradigm

* Single-threaded

* Concurrent

* Never Blocking

Note:

Dynamic (it can execute many common behaviors at runtime rather than having to be compiled)

Weakly Typed (types are not declared or firmly adhered to making things like type coercion possible)

Prototype-Based (OOP style based on sharing behavior through objects or 'prototypes')

Multi-paradigm (permits the use of different programming paradigms)

Single-threaded (it can only execute one action at any given time)

Concurrent (capable of delegating multiple tasks simultaneously)*

Never Blocking (I/O does not interfere with user input and activity)

How can it be concurrent and single threaded??? We'll get to that.

---

# Parallelism
# and
# Concurrency

Note:  Can anyone describe these terms?
---

* **Concurrency**:
processes can run independently of one another, but they do not necessarily run at the same time.

* **Parallelism**:
multiple processes can run at exactly the same time.

Note:
Parallel environments can be described as concurrent, but not all concurrent environments are parallel.

---
<div style='display: flex; justify-content: space-around;'>
<div style='display:flex; flex-direction: column;'>
<div>Concurrent</div>

<img src='https://camo.githubusercontent.com/6b343cdc5f88e50537f6f01fbd36030f0c7334dc/68747470733a2f2f627974656172636865722e636f6d2f61727469636c65732f706172616c6c656c2d76732d636f6e63757272656e742f636f6e63757272656e742d322e706e67' style='height: 500px;'/></div>
<div style='display:flex; flex-direction: column;'></div>

<div style='display:flex; flex-direction: column;'>

<div>Parallel</div>

<img src='https://camo.githubusercontent.com/822abcb289939f1647d76957f15c3fe78c87a146/68747470733a2f2f627974656172636865722e636f6d2f61727469636c65732f706172616c6c656c2d76732d636f6e63757272656e742f706172616c6c656c2d322e706e67' style='height: 500px;'/></div>
</div>

Note:
Which term did we use to describe JS before? How does JavaScript execute code concurrently?
---

## The JavaScript Engine
## and
## The JavaScript Runtime Environment

Note:
Can anyone describe these?

---

* **JavaScript Engine**:
interprets your JS code and turns it into runnable commands.

* **JavaScript Runtime Environemnt**:
supports your JavaScript by providing it with common objects and ways to communicate with the world outside your code

Note:
These two things make up the JS we use everyday.

---

Which pieces belong to which parts?

<img style='height: 600px;' src='https://camo.githubusercontent.com/bd3cc88e02a70dbd46694ef8ad2f0b5741725d7e/68747470733a2f2f63646e2d696d616765732d312e6d656469756d2e636f6d2f6d61782f3830302f312a4641394e47784e42362d76316f4932714745746c52512e706e67'/>

Note:
Walk step by step through the flow of the e-loop.  Define each part.
---

How it all comes together:

<img style='height: 600px;' src='https://camo.githubusercontent.com/df1ee9824df5f259718375500bdc2cbdca148934/68747470733a2f2f63646e2d696d616765732d312e6d656469756d2e636f6d2f6d61782f3830302f312a546f7a53726b6b39326c38686f3664384a7871465f772e676966'/>

---

# Asynchronicity

Note:
What does this mean?

---

## Asynchronicity in JS:
* Callbacks
* Promises

Note:
The combination of callbacks and promises on top of the task queue and event loop are what give us asynchronicity in JS.

---

## What is a callback in JavaScript?

---

###**Callback:**
a function passed into another function as an argument, which is then invoked inside the outer function to complete some kind of routine or action.

---

## What is a promise in JavaScript?

---

###**Promise:**
an object that represents the eventual completion (or failure) of an asynchronous operation

Note:
Promises allow us to wait for asynchronous code and then execute other code upon completion.

---

###**Promise.all()**

and

###**async/await**

Note:

Who has experience with these?
switch to code demo

---

#wat!?

**Thats all! Any questions?**
