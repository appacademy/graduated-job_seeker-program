# Partner A Interviews Partner B

## Easy

#### Pt. 1)

Oh no! Somebody added a click handler to the top level of your webpage (`document`) that closes the browser window on `click` ☹️. There is no way for us to remove this event listener, but good thing we are DOM Wizards! Instead of allowing this event to fire, we want to alert `Defense!`. How might we utilize event listeners to accomplish this?

### Solution

We could stop this event from ever triggering by utilizing `event.stopPropagation`. For example, we could add an event listener to the `html` (outermost) element. Here's what that would look like:

```js
const html = document.getElementsByTagName('html')[0];

html.addEventListener('click', (e) => {
  e.stopPropagation();
  alert('Defense!');
});
```

#### Pt. 2)
_Non-whiteboarded_

The DOM Villain is onto us. Every time we add a `click` listener to an element on our webpage, he proceeds to add another `click` listener to the **same** element that closes the browser window. Once again, our goal is to keep our website open! We want to add an event listener to our `body` element, but we know the DOM Villian will add one right after us. What `Event` method can we use to make sure no subsequent event listeners get fired on that same element?

**A:** `e.stopImmediatePropagation()`. `e.stopPropagation` only prevents events from propagating outwards; not other events on the same DOM object.

---

## Medium

Write a function, `isDescendant`, that takes two DOM nodes as arguments, a `child` and a `parent`. This method should verify that the child node is a descendant of the parent node, and return `true` or `false`. The child **does not** have to be a _direct_ descendant of the parent.

### Example

```html
<div id='parent'>
  <ul>
    <li id='child'>I am a child</li>
  </ul>
  <p id='not-a-parent'></p>
</div>
```

```js
const child = document.getElementById('child');
const parent = document.getElementById('parent');
const notParent = document.getElementById('not-a-parent');

isDescendant(parent, child) // true
isDescendant(notParent, child) // false
```

### Solution

```js
function isDescendant(parent, child){
  while (child.parentNode) {
    if (child.parentNode == parent)
      return true;
    else
      child = child.parentNode;
  }

  return false;
}
```

Take note of the `==` vs. `===`. `child.parentNode` will return a _new_ instance of a node object, so we have to do a soft comparison.

---

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
