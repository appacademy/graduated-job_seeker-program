# Partner A Interviews Partner B

## Rapid Fire



## Easy

Write a function, `isDescendant`, that takes two DOM nodes as arguments, a `child` and a `parent`. This method should verify that the child node is a descendant of the parent node, and return `true` or `false`.

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

>NOTE: Take note of the `==` vs. `===`. `child.parentNode` will return a _new_ instance of a node object.


## Medium

## Hard

We have an HTML page with a single `Click Me!` button on it. When we click anywhere on the page, two things should happen:

+ The content of the button should now say `Don't Click Me!`
+ The button should be disabled

Clicking anywhere on the page _**again**_ should then return the button to it's original state. I should be able to keep clicking the page, and see the button toggle back and forth.

Additionally, clicking on the button itself should not do anything -- It's just there for fun 😌

Write a function, `toggleButton`, that implements this functionality!

### Solution

```js

function toggleButton() {

  const button = document.getElementsByTagName('button')[0];

  const disableCallback = () => {
    button.removeAttribute('disabled');
    button.innerHTML = 'Click Me!';
    document.removeEventListener('click', disableCallback);
    document.addEventListener('click', enableCallback);
  }

	const enableCallback = () => {
		button.setAttribute('disabled', '');
		button.innerHTML = 'Don\'t Click Me!';

    document.removeEventListener('click', enableCallback);
		document.addEventListener('click', disableCallback);
  }

	document.addEventListener('click', enableCallback);
	button.addEventListener('click', e => e.stopPropagation());
}
```
