# Partner A Interviews Partner B

## Rapid Fire

**Q:** What happens during the `capture` phase after clicking somewhere on a browser page?
**A:** When you clicked, browser knows a click event occurred. It starts from the window (lowest level/root of your website), then goes to document, then html root tag, then body, then all child elements, until it gets to the `target` (i.e. the element you click on). Its trying to reach the lowest level of element as possible. This is called capture phase.

**Q:** What happens when you have reached this target?
**A:** The browser will check if you have any click handlers on this element. If you do, the browser will run any functions associated with this click handler.

---

## Easy

We have a webpage with a hefty comments section; 1000 `li` elements inside of a `ul`! Write a function that, when run, will enable the following behavior:

+ Any time you click an `li`, the `innerHTML` should be set to `I have been clicked.`.

You may assume there is only one `ul` on the page.

### Naive Solution

Select all `li` elements and add an event listener to each one of them individually. That may look something like this:

```js
const lis = document.getElementsByTagName('li');

for (let i = 0; i < lis.length; i++) {
  lis[i].addEventListener('click', e => e.currentTarget.innerHTML = 'I have been clicked.');
}
```

While this would work, this a very inefficient way of doing about this for several reasons. Prompt your partner with these two questions:

1) How many different click handlers are we putting on our page? How many different functions are we making?
> A: If there are 100 li's, we are creating 100 click handlers and 100 functions

2) What if `li` elements could be dynamically added to the page (i.e. a comments or reviews section), and we wanted them to have the same functionality. Would this version of the function work?
> A: No, this wouldn't work because the click handlers were only added to each individual element with the page loaded.

### Better solution

A more reasonable solution would be to add the event listener on the ul. Remember, `Event` objects have a `currentTarget` _and_ a `target` attribute. `target` is the element that triggered the event (e.g., the user clicked on), and `currentTarget` is the element that the event listener is attached to.

```js
const ul = document.getElementsByTagName('ul')[0];

ul.addEventListener('click', e => e.target.innerHTML = 'I have been clicked.');
```

---

## Medium

...


## Hard


Write a function, `makeNodeTree`, that takes in an array of HTML tagnames (as strings) and a root Node. Your function should accomplish the following:

+ The first element of the array should be appended to the target node passed into the function.
+ Every subsequent array element should be appended as a child to the previous one.
+ When there are no more children to be appended (you are at the end of the array), insert the content `Done!` to the last appended element.

### Example

```js
const targetDiv = document.getElementById('target');

makeNodeTree(['div', 'section', 'span', 'p'], targetDiv);
```

This should result in an HTML layout that looks like this:

```html
<div id='target'>
  <div>
    <section>
      <span>
        <p>Done!</p>
      </span>
    </section>
  </div>
</div>
```

### Solution

**Recursive**

```js
function makeNodeTree(root, elements) {
  if (!elements.length) {
    root.append('Done!');
  } else {
    const newElement = document.createElement(elements.shift());
    root.appendChild(newElement);
    makeNodeTree(newElement, elements);
  }
}
```

**Iterative**

```js
function makeNodeTree(root, elements) {
  let currentElement = document.createElement(elements[0]);
  root.appendChild(currentElement);

  for (let i = 1; i < elements.length; i++) {
    const newElement = document.createElement(elements[i]);
    currentElement.appendChild(newElement);

    currentElement = newElement;
  }

  currentElement.innerHTML = 'Done!';
}
```
