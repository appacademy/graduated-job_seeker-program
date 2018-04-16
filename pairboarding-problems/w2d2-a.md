# Partner A Interviews Partner B

## Rapid Fire



## Easy


## Medium




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

  currentElement.append('Done!');
}
```
