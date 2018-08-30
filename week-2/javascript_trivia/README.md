

# Technical Trivia

Technical trivia is a huge part of the interview process.  Both phone screens and on-sites can include a round or rounds of technical trivia. Making sure you are comfortable with the the trivia environment, the questions themselves, and how to answer them is invaluable in your job search.

### Strategy:

Whenever we are answering technical questions, we should always keep the following in mind:

* **Simple and concise answers:** There's no need to go in depth.  Try to keep your answers to one sentence.  If the interviewer wants you to go more into depth, they will ask you to.
* **Examples:** In some cases, a single sentence isn't enough, or perhaps your understanding of a concept isn't 100%.  In those cases use an example of whatever the answer is to the question, but try to keep the example in as few sentences as possible as well.
* **Be honest:** Do not try to answer if you know you do not have the answer. Dead air when you are grasping for an answer (especially over the phone) is never helpful. State confidently that you are not familiar with the answer and let the process continue.
* **KEEP STUDYING!** At the end of the day, the only sure fire way to get better is to keep studying.  We can never know all the answers, but we can always learn more.

## Instructions:

For today's technical trivia event:

* Groups of three will ask one another trivia in three rounds.
* for each round:
  * One person will ask the questions
  * One person will answer the questions
  * One person will be score keeper, keeping track of how many answers are correct. Correct answers are at the score keeper's discretion.
  * Answerers will have a maximum of 8 minutes to answer as many questions as they can. The person asking the questions will monitor time.
* After the first three rounds, the participants from each group with the highest score will take turns answering trivia Spelling-Bee style while the moderator asks them questions one by one.  
* If a player cannot answer their question or answers incorrectly they will be disqualified.  If there are only two participants left, and a participant cannot answer their question, the same question will be asked to the other participant.  If neither can answer the question, both will stay in the game and a new question will be asked.
* Questions are asked until a winner is declared.
* Questions are different for each round and will vary in difficulty.


***_NB_**: _This is just a sample of some common technical trivia questions. The reality is there's no knowing what trivia might be asked, so it's important to maintain your study habits on practical coding._   

## Round One

_click on the question to navigate to its' answer.  Click on the "back to" link from the answer to return to the questions_

* [Why do you need doctype?](#why-do-you-need-doctype)
* [What is the use of data-* attribute?](#what-is-the-use-of-the-data--attribute)
* [What is createDocumentFragment?](#document-fragment)
* [What does float do?](#what-does-float-do)
* [Are CSS properties case sensitive?](#are-css-properties-case-sensitive)

* [What is position static?](#what-is-position-static)

* [Is there implicit function return in JavaScript?](#implicit-return-in-javascript)

* [What are 5 of the 7 "falsey" values in JavaScript?](#what-are-the-7-falsey-values-in-javascript)

* [What is a primitive datatype in Javascript?](#what-is-a-primitive-datatype-in-javascript)
* [Consider the following expression: `var y = 1, x = y = typeof x`. What will be the value of x?](#value-of-x)
* [If `const a = 2, b = 3` what would be value of `a && b`?](#a-and-b)
* [Does the following code throw a reference error? Why/Why not?](#why-does-the-following-code-work)

```js
sayHello(); // OUTPUT: "Hello";

function sayHello() {
  return "Hello";
}
```
* [Is null an object?](#is-null-an-object)
* [Are `let` and `const` hoisted?](#are-let-and-const-hoisted)
* [Briefly describe the concept of memoization](#briefly-describe-the-concept-of-memoization)



## Round Two

_click on the question to navigate to its' answer.  Click on the "back to" link from the answer to return to the questions_

* [How can you change the direction of html text?](#how-can-you-change-the-direction-of-html-text)
* [How do you highlight text in html?](#how-can-you-highlight-text-in-html)
* [Which of these executes first: ```document.onload``` or ```window.onload``` ?](#which-of-these-executes-first)
* [Does margin-top or margin-bottom effect inline elements?](#does-margin-top-or-margin-bottom-effect-inline-elements)
* [What is position relative?](#what-is-position-relative)
* [Name three pseudo selectors](#name-three-pseudo-selectors)
* [Name all six primitive data-types in Javascript](#name-all-six-primitive-data-types-in-javascript)
* [What is the difference between `null` and `undefined`?](#what-is-the-difference-between-null-and-undefined)
* [What is the value of `this` inside of a `setTimeout` function?](#what-is-the-value-of-this-inside-of-a-settimeout-function)
* [What is the Value of `this` inside of a constructor function?](#what-is-the-value-of-this-inside-of-a-constructor-function)
* [What is the Temporal Dead Zone?](#what-is-the-temporal-dead-zone)
* [Can you directly compare two objects in Javascript?](#can-you-directly-compare-two-objects-in-javascript)
* [What does the bind method do?](#what-does-bind-do)
* [What is the difference between window and document?](#what-is-the-difference-between-window-and-document)
* [What are two-way data binding and one-way data flow, and how are they different?](#data-binding)


## Round Three

_click on the question to navigate to its' answer.  Click on the "back to" link from the answer to return to the questions_

* [Will the browser make an http request for the following case?](#will-the-browser-make-an-http-request-for-the-following-case)
  ```HTML
  <img src="mypic.jpg" style="visibility: hidden" alt="My photo">
  ```
* [Is style1.css downloaded before Paragraph 1 is rendered?](#does-style1css-have-to-be-downloaded-before-paragraph-1-is-rendered)
```HTML
<head>
    <link href="style1.css" rel="stylesheet">
</head>
<body>
    <p>Paragraph 1</p>
    <p>Paragraph 2</p>
    <link href="style2.css" rel="stylesheet">
</body>
```
* [What is an optional closing tag?](#what-is-an-optional-closing-tag)
* [Does padding-top or padding-bottom effect inline elements?](#does-padding-top-or-padding-bottom-effect-inline-elements)

* [What is position absolute?](#what-is-position-absolute)

* [List css specificity rules from most specific to least specific](#list-css-specificity-rules-from-most-specific-to-least-specific)
* [Explain variable hoisting](#explain-variable-hoisting)
* [Does javascript pass parameter by value or by reference?](#does-javascript-pass-parameter-by-value-or-by-reference)
* [In what order will the numbers 1-4 be logged to the console when the code below is executed? Why?](#event-loop)

```js
function counter() {
    console.log(1);
    setTimeout(() => console.log(2), 1000);
    setTimeout(() => console.log(3), 0);
    console.log(4);
}

counter();
```
* [What are the three phases of event propagation?](#what-are-the-three-phases-of-event-propagation)
* [Is javascript compiled or interpreted?](#is-javascript-compiled-or-interpreted)
* [What does the global object refer to in JavaScript?](#what-does-the-global-object-refer-to-in-javascript)
* [What does the `length` property of the JavaScript Function object return?](#what-does-length)
* [When inspecting a MouseEvent object, which of the following do target and currentTarget represent?](#current-target)
* [What is a prototype in JavaScript?](#what-is-a-prototype-in-javascript)

## Round Four

_click on the question to navigate to its' answer.  Click on the "back to" link from the answer to return to the questions_

* [What is position fixed?](#what-is-position-fixed)

* [What are the differences between == and ===?](#equal)
* [If you create a function that takes 2 arguments, but invoke it with 3 arguments, how can you access the third variable?](#args)
* [What is a potential pitfall with using typeof bar === "object" to determine if bar is an object? How can this pitfall be avoided?](#typeof)
* [What is NaN? What is its type? How can you reliably test if a value is equal to NaN?](#nan)
* [What is a closure in javascript?](#what-is-a-closure-in-javascript)
* [When you zoom in on your browser and the page gets bigger, what exactly happens?](#zoom)
* [What is asynchronous programming?](#what-is-asynchronous-programming)
* [What are the proper keywords for error handling in JavaScript?](#what-are-the-proper-keywords-for-error-handling-in-javascript)
* [Name two differences between var and let](#var-and-let)
* [What does ```[] + []``` evaluate to in JS?](#wat)
* [What does ```"2" + 1``` evaluate to in JS?](#watman)
* [Name 2 programming paradigms in JS](#paradigms)
* [Which of these two is hoisted in JS: Function declaration or Function expression?](#declaration-or-expression)
* [In JS are strings mutable or immutable?](#mutability)
* [What is the difference between scope and context?](#scope-context)
* [What is the difference between position relative and position absolute?](#css-positions)
* [What is {} + {} in JS?](#watwatwat)
* [What is a Stack and what is a Stack Overflow?](#stacks-on-stacks)
* [What is the difference between a GET request and a POST request?](#get-post)
* [What are the three ways to pass params in an http request?](#http-params)
* [Besides syntax, name one principle difference between an arrow function and normal function in JS.](#fat-arrow)
* [What is the difference between .call and .apply?](#call-apply)
* [How would you differentiate div, section, and article?](#how-would-you-differentiate-div-section-and-article)
* [What is the difference between a canvas element and an SVG?](#what-is-the-difference-between-a-canvas-element-and-an-svg)
* [What are the differences between div and span?](#what-are-the-differences-between-div-and-span)
* [How could you run event handler in the capturing phase not in bubble phase?](#how-could-you-run-event-handler-in-the-capturing-phase-not-in-bubble-phase)
* [Why can we call methods on certain primitive datatypes?](#why-can-we-call-methods-on-certain-primitive-datatypes)
* [What is the "this"/context when invoking a function in each of the three possible ways in JS?](#this-context)
* [Define the Temporal DeadZone](#dead-zone)
* [What does ORM stand for and name an example?](#orm)
* [Consider the following two functions below. Will they both return the same thing? Why or why not?](#twofunctions)
```js
function foo1()
{
  return {
      bar: "hello"
  };
}

function foo2()
{
  return
  {
      bar: "hello"
  };
}
```
* [Can you user .forEach on a node list?](#for-each-on-node-list)
* [Name the two ways you can create a node element](#two-ways)
* [What are repaint and reflow?](#repaint-and-reflow)
* [How could you capture every click on a page?](#every-click)
* [What is the difference between the javascript engine and the JS runtime environment?](#JSRE-vs-SJI)
* [Is javascript concurrent, parallel or both?](#javascript-concurrent)


=====

## Answers

##### Why do you need doctype?

* Doctype is an instruction to the browser to inform about the version of the html document and how browser should render it.
[Back to Round One qs](#round-one)

##### What is the use of the data-* attribute?

* It allows you to store extra information/ data in the DOM. You can write valid html with embedded private data. You can easily access the data attribute by using javascript and hence a lot of libraries like knockout use it.
[Back to Round One qs](#round-one)

##### <a name='document-fragment'></a> What is createDocumentFragment?

* createDocumentFragment is like a mini DOM you can append elements to in order to avoid costly insertions. Once you've appended elements to the fragment, you can append the fragment to a node element and the fragment itself will disappear.

[Back to Round One qs](#round-one)

##### What does float do?

*  Float removes the element from the normal flow of the document and pushes the element to the sides of the page with text wrapping around it.

[Back to Round One qs](#round-one)

##### Are CSS properties case sensitive?

* No

[Back to Round One qs](#round-one)

##### What is position static?

* The default position value for an html element.  Not relative, absolute, fixed, or sticky.

[Back to Round One qs](#round-one)

##### Implicit return in JavaScript

* Yes, via one line big arrow functions or big arrow functions that wrap their block in parentheses.  

[Back to Round One qs](#round-one)

##### How can you apply css rules specific to media/screen-size?

* Use @media to set rules based on media width, orientation, etc. Example:
```CSS
@media (max-width: 700px) and (orientation: landscape){}
```

[Back to Round One qs](#round-one)

##### What are the 7 falsey values in javascript?

* `0`, `""`, `NaN`, `-0`, `null`, `undefined`, `false`

[Back to Round One qs](#round-one)

##### What is a primitive datatype in Javascript?

* A primitive datatype is not an object, is **immutable**, and has no attributes/methods defined directly on it

[Back to Round One qs](#round-one)

##### <a name='value-of-x'></a> Consider the following expression: `var y = 1, x = y = typeof x`. What will be the value of x?

* `undefined`

[Back to Round One qs](#round-one)

##### <a name='a-and-b'></a> If `const a = 2, b = 3`, what would be the value of `a && b`?
* 3

[Back to Round One qs](#round-one)

##### Why does the following code work?
* Because named functions are hoisted and can be used before their declaration

[Back to Round One qs](#round-one)

##### Is `null` an object?
* No. Even though `typeof null` returns `object`, this is a bug. You can not put any attributes on null, as it is a `primitive` datatype.

[Back to Round One qs](#round-one)

##### Are let and const hoisted?
* Yes

[Back to Round One qs](#round-one)

##### Briefly describe the concept of memoization
* Memoization is a programming technique which attempts to increase a function’s performance by caching its previously computed results. POJO's are often used to implement these caches.

[Back to Round One qs](#round-one)



=====

##### How can you change the direction of html text?

* use bdo (bidirectional override) element of html.
```html
<p><bdo dir="rtl">This text will go right to left.</bdo></p>
```
 [Back to Round Two qs](#round-two)

##### How can you highlight text in html?

* Use mark element.
```html
<p>Some part of this paragraph is <mark>highlighted</mark> by using mark element.</p>
```

[Back to Round Two qs](#round-two)

##### Which of these executes first

* ```document.onload``` executes first

[Back to Round Two qs](#round-two)

##### Does margin-top or margin-bottom effect inline elements?

* No

[Back to Round Two qs](#round-two)

##### What is position relative?

* The computed position of the element where it can be spaced in relation to its' normal position in the flow of the document using ```top```, ```bottom```, ```left```, and ```right```

[Back to Round Two qs](#round-two)

##### Name three pseudo selectors:

* :hover, :nth-of-type, :visited, :focus, :link, :first, :child, :checked, :last-child, :target, etc.

[Back to Round Two qs](#round-two)


##### Name all six primitive data-types in Javascript:

* boolean, string, number, null, undefined, and symbol (ES6 only)

[Back to Round Two qs](#round-two)

##### What is the difference between `null` and `undefined`?

* Undefined means the value of a variable is not defined. JS has a global variable called `undefined` whose value is `undefined`.
* `null` means empty or non-existent value which is used by programmers to indicate “no value”. Must be explicitly assigned.

[Back to Round Two qs](#round-two)

##### What is the Value of `this` inside of a setTimeout function?

* The window

[Back to Round Two qs](#round-two)

##### What is the Value of `this` inside of a constructor function?

* A newly created object

[Back to Round Two qs](#round-two)

##### What is the Value of `this` inside of a constructor function?

* A newly created object

[Back to Round Two qs](#round-two)

##### What is the Temporal Dead Zone?

* This has to do with the topic of hoisting. The temporal deadzone is the time between entering a scope where a variable is declared (i.e. an `if` statement or `while` loop), and the actual declaration and initialization of that variable. During this period, `let` and `const` variables cannot be accessed (you will get a `Reference Error`), even though they have been hoisted. Example:

```js
console.log('out of scope');

if (true) {
  // Enter temporal deadzone. `x` is created and hoisted as soon as we enter scope.
  console.log('In the scope!');  // TEMPORAL DEADZONE
  // TEMPORAL DEADZONE
  let x = "Test Variable"; // No longer in the temporal deadzone
}
```

[Back to Round Two qs](#round-two)

##### What is the Temporal Dead Zone?

* This has to do with the topic of hoisting. The temporal deadzone is the time between entering a scope where a variable is declared (i.e. an `if` statement or `while` loop), and the actual declaration and initialization of that variable. During this period, `let` and `const` variables cannot be accessed, even though they have been hoisted.

[Back to Round Two qs](#round-two)

##### Can you directly compare two objects in Javascript

* No.

[Back to Round Two qs](#round-two)

##### What does bind do?

* The bind method creates a _new_ function that, when called, has its `this` keyword set to the first parameter passed into it. All subsequent parameters are arguments for that bound function.

[Back to Round Two qs](#round-two)

##### What is the difference between window and document?

* JavaScript has a global object and everything runs under it. `window` is that global object that holds global variables, global functions, location, history everything is under it. `document` is also under window. document is a property of the window object. document represents the DOM and DOM is the object oriented representation of the html markup you have written

[Back to Round Two qs](#round-two)

##### <a name='data-binding'></a> What are two-way data binding and one-way data flow, and how are they different?

* This a tough-y 😎. Here's the deal: **Two-way data binding** means that UI fields are bound to model data dynamically. I.e., when a UI field changes, the model data changes with it and vice-versa. An example of this is Angular.js, which uses two-way binding. **One way data flow** means that the model is the **single source of truth**. A change in UI is not _directly_ bound to the model. An example of a one-way data flow framework is React. Only the model, or `store` in this case, has access to the application's state.  

[Back to Round Two qs](#round-two)


=====

##### Will the browser make an http request for the following case?

* Yes!

[Back to Round Three qs](#round-three)

##### <a name='#does-style1css-have-to-be-downloaded-before-paragraph-1-is-rendered'></a>Does style1.css have to be downloaded before Paragraph 1 is rendered?

* Yes!

[Back to Round Three qs](#round-three)

##### What is an optional closing tag?

* p, li, td, tr, th, html, body, etc. do not have to provide an end tag. However, you have to escape the tag.
```HTML
<p>Some text
<p>Some more text
<ul>
 <li>A list item
 <li>Another list item
</ul>
```
is read as:
```HTML
<p>Some text</p>
<p>Some more text</p>
<ul>
 <li>A list item</li>
 <li>Another list item</li>
</ul>
```

[Back to Round Three qs](#round-three)

##### Does padding-top or padding-bottom effect inline elements?

* No

[Back to Round Three qs](#round-three)

##### What is position absolute?

* The computed position of the element where it can be spaced after being removed to from the normal flow of the document.  It is spaced in relation to its' first non-static parent container with `top`, `bottom`, `left`, and `right`.

[Back to Round Three qs](#round-three)

##### List css specificity rules from most specific to least specific:

* inline, ID, class, element, universal (4 out of 5 is acceptable)

[Back to Round Three qs](#round-three)

##### Explain variable hoisting:

* At a broad level, hoisting is the concept of having access to named functions and variables (only `var`s) before they are declared in your code. This works because variable and function declarations are put into memory during the compile phase.

[Back to Round Three qs](#round-three)

##### Does javascript pass parameter by value or by reference?

* It depends on the datatype. Primitive types (string, number, etc.) are passed by value and objects are passed by reference. If you change a property of the passed object, the object will be affected.

[Back to Round Three qs](#round-three)

##### <a name='event-loop'></a> In what order with the numbers 1-4 be logged to the console when the code below is executed? Why?

* `1, 4, 3, 2`. 1 and 4 come first because they are logged without delay. 3 comes before 2 because it has a shorter asynchronous delay. Even though `3` has a delay of `0`, it is still placed on the event queue while the browser is busy. You can think of a `setTimeout` of `0` as meaning "as soon as possible".

[Back to Round Three qs](#round-three)

##### What are the three phases of event propagation?

* 1. Capturing phase: Events begin at the top level and move inwards towards the target (the node you clicked)
  2. Target node: If there are registered handlers at the target node, they are run.
  3. Bubbling phase: Event walks back outwards towards root; all encountered event handlers are run on the way.

[Back to Round Three qs](#round-three)

##### Is Javascript compiled or interpreted?

* Interpreted.

[Back to Round Three qs](#round-three)

##### What does the global object refer to in JavaScript?

* A POJO that exists to provide all built-in methods and global variables.

[Back to Round Three qs](#round-three)

##### <a name='what-does-length'></a> What does the "length" property of the JavaScript Function object return?

* The number of arguments taken by the function (not including rest parameters)

[Back to Round Three qs](#round-three)

##### <a name='current-target'></a> When inspecting a MouseEvent object, which of the following do `target` and `currentTarget` represent?

* `currentTarget`: the element the listener is set on, `target`: the element the mouse is on.

[Back to Round Three qs](#round-three)

##### What are the proper keywords for error handling in JavaScript?

* "try...catch"

[Back to Round Three qs](#round-three)

##### What is a prototype in JavaScript?

* An object.

[Back to Round Three qs](#round-three)

=====

##### What are the differences between div and span?

* Div is a block element and span is inline element. [Back to Round Four qs](#round-four)

##### How would you differentiate div, section, and article?

* ```<section>``` , group of content inside is related to a single theme, and should appear as an entry in an outline of the page. It’s a chunk of related content, like a subsection of a long article, a major part of the page (eg the news section on the homepage), or a page in a webapp’s tabbed interface. A section normally has a heading (title) and maybe a footer too.

* ```<article>``` , represents a complete, or self-contained, composition in a document, page, application, or site and that is, in principle, independently distributable or reusable, e.g. in syndication. This could be a forum post, a magazine or newspaper article, a blog entry, a user-submitted comment, an interactive widget or gadget, or any other independent item of content.

* ```<div>``` , on the other hand, does not convey any meaning, aside from any found in its class, lang and title attributes.
[Back to Round Four qs](#round-four)

##### What is the difference between a canvas element and an SVG?
(Any of these points will suffice to illustrate the differences.)
* SVG: Object Model-based (SVG elements are similar to HTML elements).  Graphical elements become part of the DOM. Visual presentation created with markup and modified by CSS or script. API supports accessibility. API does not support accessibility; markup-based techniques must be used in addition to canvas.

* Canvas: Pixel-based (canvas is essentially an image element with a drawing API). Single HTML element similar to <img> in behavior. Visual presentation created and modified programmatically through script.
[Back to Round Four qs](#round-four)

##### Do padding-left, padding-right, margin-left, or margin-right effect inline elements?

* Yes!

[Back to Round Four qs](#round-four)

##### Why can we call methods on certain primitive datatypes?

* Technically, you can't. **But**, certain primitive datatypes, like strings, numbers, and booleans, have _non_-primitive counterparts (String, Number, Boolean). So, if you call `"string".slice(5)`, that string will be implicitly cast to a `String` object, and the `slice` method will be called on that.

[Back to Round Four qs](#round-four)

##### What is position fixed?

* The computed position of an element where it's position is constant or 'fixed' in relation to the window.  Its' position and presence never change.

[Back to Round Four qs](#round-four)

##### What is position sticky?

* From MDN: It's treated as relatively positioned until its containing block crosses a specified threshold (such as setting top to value other than auto) within its flow root (or the container it scrolls within), at which point it is treated as "stuck" (it doesn't move) until meeting the opposite edge of its containing block.

[Back to Round Four qs](#round-four)


##### <a name="equal"></a> What are the differences between `==` and `===` ?

* `==` will not check types and `===` will check whether both sides are of same type. `==` will convert to its convenient type to have both in same type and then do the comparison.

[Back to Round Four qs](#round-four)

##### How could you run event handler in the capturing phase not in bubble phase?

* There is a third (optional) parameter in addEventListener and removeEventLister. You can pass true or false to useCapture phase.

[Back to Round Four qs](#round-four)

##### <a name='args'></a> If you create a function that takes 2 arguments, but invoke it with 3 arguments, how can you access the third variable?

* The `arguments` keyword that is available in all functions.

[Back to Round Four qs](#round-four)

##### <a name='typeof'></a> What is a potential pitfall with using typeof bar === "object" to determine if bar is an object? How can this pitfall be avoided?

* Although `typeof bar === "object"` is a reliable way of checking if bar is an object, the surprising gotcha in JavaScript is that null is also considered an object!

[Back to Round Four qs](#round-four)

##### <a name='twofunctions'></a> Consider the following two functions below. Will they both return the same thing? Why or why not?

* The first function will return `Object { bar: "hello" }`. The second function will return `undefined`. This is because of semicolon insertion. The compiler will automatically put a semicolon after the return in the second function, therefor returning undefined.

[Back to Round Four qs](#round-four)

##### <a name='nan'></a> What is NaN? What is its type? How can you reliably test if a value is equal to NaN?

* `NaN`s type is `Number`. `NaN` compared to _anything_, even itself, is false. One way to check if they are equal is using the built in `isNaN()` function.

[Back to Round Four qs](#round-four)

##### What is a closure in javascript?

* Specifically: A closure is an inner function that has access to the variables in the outer (enclosing) function’s scope chain. The closure has access to variables in three scopes; specifically: (1) variable in its own scope, (2) variables in the enclosing function’s scope, and (3) global variables.

[Back to Round Four qs](#round-four)

##### When you zoom in on your browser and the page gets bigger, what exactly happens?

* The browser increases the size of each pixel by the percentage of the zoom.

[Back to Round Four qs](#round-four)

##### What is asynchronous programming?

* Synchronous programming means code is executed sequentially from top-to-bottom, blocking on long-running tasks such as network requests and disk I/O. Asynchronous programming means that the engine runs in an event loop. When a blocking operation is needed, the request is started, and the code keeps running without blocking for the result.

[Back to Round Four qs](#round-four)

##### <a name='what-are-the-proper-keywords-for-error-handling-in-javascript'></a> What are the proper keywords for error handling in JavaScript?

* ```try``` and ```catch```

[Back to Round Four qs](#round-four)

##### <a name='var-and-let'></a> Name two differences between var and let

*```var``` is globally scoped and returns undefined before it is declared.  ```let``` is block scoped and throws an error if accessed before it is defined.

[Back to Round Four qs](#round-four)

##### <a name='wat'></a> What does ```[] + []``` evaluate to in JS?

* "", empty string

[Back to Round Four qs](#round-four)

##### <a name='watman'></a> What does ```"2" + 1``` evaluate to in JS?

* "21"

[Back to Round Four qs](#round-four)

##### <a name='paradigms'></a> Name 2 programming paradigms in JS

* OOP, functional programming, also imperative

[Back to Round Four qs](#round-four)

##### <a name='declaration-or-expression'></a> Which of these two is hoisted in JS: Function declaration or Function expression?

* Function declaration

[Back to Round Four qs](#round-four)

##### <a name='mutability'></a> In JS are strings mutable or immutable?

* immutable

[Back to Round Four qs](#round-four)

##### <a name='invocation'></a> What are the three ways we can invoke a function in JS?

* Function style, method style, constructor style

[Back to Round Four qs](#round-four)

##### <a name='this-context'></a> What is the "this"/context when invoking a function in each of the three possible ways in JS?

* Function: the global environment("window"), Constructor: The instance of the object, Method: the object the function is being called on.

[Back to Round Four qs](#round-four)

##### <a name='scope-context'></a> What is the difference between scope and context?

* Scope is the lexical environment of the code/function("block scoped, function scoped, globally scoped") while context is to what the invoked function 'belongs' or what the function is being called upon, referred to as "this".

[Back to Round Four qs](#round-four)

##### <a name='dead-zone'></a> Define the Temporal DeadZone

* The time between the hoisting of a variable and the variables assignment in the code. When var returns undefined and when let and const return Errors

[Back to Round Four qs](#round-four)

##### <a name='css-positions'></a> What is the difference between position relative and position absolute?

*  Position relative places an element on the page in relation to its' normal position in the flow of the document, keeping the element within the flow of the document. The element can then be offset using 'top', 'bottom', 'left', or 'right' css properties.  Position absolute places the element in relation to it's closest non-static ancestor and removes the element from the normal flow of the document. The same css properties can move the element around the page.

[Back to Round Four qs](#round-four)

##### <a name='orm'></a> What does ORM stand for and name an example?

* Object Relational Mapping.  Ex: ActiveRecord, Mongoose

[Back to Round Four qs](#round-four)

##### <a name='watwatwat'></a> What is {} + {} in JS?

* NaN

[Back to Round Four qs](#round-four)

##### <a name='stacks-on-stacks'></a> What is a Stack and what is a Stack Overflow?

* A stack is an abstract data type that follows a first-in; last-out model.  Stacks are made up of stack frames that can be placed on the top of the stack, then popped off the top of the stack, like a pile of trays.  A stack overflow is when the number of stack frames on the stack reaches a predetermined limit and execution of stack frames is stopped to prevent infinitely processed operations.

[Back to Round Four qs](#round-four)

##### <a name='get-post'></a> What is the difference between a GET request and a POST request?

* A GET request requests information to be displayed on the client side from the DB.  A POST request uploads data to be inserted into the DB.

[Back to Round Four qs](#round-four)

##### <a name='http-params'></a> What are the three ways to pass params in an http request?

* In the URL, In the Query String, or in the body of the request

[Back to Round Four qs](#round-four)

##### <a name='fat-arrow'></a> Besides syntax, name one principle difference between an arrow function and normal function in JS.

* Either implicit return in one line signatures, or auto-binding of context from function declaration.

[Back to Round Four qs](#round-four)

##### <a name='call-apply'></a> What is the difference between .call and .apply?

* ```.call``` allows you to bind context while passing individual arguments to the function.  ```.apply``` allows you to bind context and pass in an array of arguments.

[Back to Round Four qs](#round-four)

##### <a name='for-each-on-node-list'></a> Can you use forEach on a node list?

* No - a node list is not an array. You can convert it to an array by using ```Array.from(node-list)``` or ```.splice```

[Back to Round Four qs](#round-four)

##### <a name='two-ways'></a> Name the two ways you can create a node element

* You can either create a node element using ```document.createElement``` or set the ```innerHTML``` of the parent element.

[Back to Round Four qs](#round-four)

##### <a name='repaint-and-reflow'></a> What are repaint and reflow?

* Repaint happens when you change the look of an element without changing the size and shape. Reflow happens when the flow of the elements in the page is changed by the insertion or removal of an element which takes up space.

[Back to Round Four qs](#round-four)

##### <a name='every-click'></a> How could you capture every click on a page?

* Just add a click event listener on the body element - each click will be captured during the bubbling phases since the body encapsulates all visible information on a web page.

[Back to Round Four qs](#round-four)

##### <a name='JSRE-vs-SJI'></a> What is the difference between the javascript engine and the JS runtime environment?

* interprets your JS code and turns it into runnable commands.
* supports your JavaScript by providing it with common objects and ways to communicate with the world outside your code.

[Back to Round Four qs](#round-four)

##### <a name='javascript-concurrent'></a> Is javascript concurrent, parallel or both?

* Just concurrent.

[Back to Round Four qs](#round-four)

=====

## Extra

* [How to serve html in multiple languages?](#how-to-serve-html-in-multiple-languages)
* [Explain standard and quirks mode.](#explain-standard-and-quirks-mode)
* [What is a semantic tag?](#what-is-a-semantic-tag)
* [Why would you use semantic tags?](#why-would-you-use-semantic-tags)

##### How to serve html in multiple languages?

* CMS could be used to deliver content in different language with same structure and style. [Back to Extra qs](#extra)

##### Explain standard and quirks mode.

* Quirks mode in the browser allows you to render pages for older browsers. This is for backwards compatibility. [Back to Extra qs](#extra)

##### What is a semantic tag?

* Semantic HTML, or "semantically-correct HTML", is HTML where the tags used to structure content are selected and applied appropriately to the meaning of the content.
For example, <b></b> (for bold), and <i></i> (for italic) should never be used, because they’re to do with formatting, not with the meaning or structure of the content. Instead, use the replacements <strong></strong> and <em></em> (meaning emphasis), which by default will turn text bold and italic (but don’t have to do so in all browsers), while adding meaning to the structure of the content. [Back to Extra qs](#extra)

##### Why would you use semantic tags?

* Search Engine Optimization, accessibility, repurposing, light code. Many visually impaired person rely on browser speech and semantic tag helps to interpret page content clearly.
