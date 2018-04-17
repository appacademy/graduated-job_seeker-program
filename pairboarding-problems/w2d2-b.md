# Partner B Interviews Partner A

## Easy

Write a method, `bringToTop`, that takes the very last HTML Element that was loaded onto the webpage, removes it, and places it at the very top.

> **HINT:** If your partner is making this harder than it needs to be, feel free to remind them of the `document.all` attribute, which returns an `HTMLCollection` (Array-like object) of all elements on the page. Because of the way this method works, the last element of this collection will be the last child rendered to the page.

### Example

Given the following original layout:

```html
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <div>
      <p>Put me at the top!</p>
    </div>
  </body>
</html>
```

The page should have this structure after the method is called:

```html
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <p>Put me at the top!</p>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <div>
    </div>
  </body>
</html>
```

### Solution

```js
function bringToTop() {
  const elements = document.all;
  const lastElement = elements[elements.length - 1];

  lastElement.remove();

  elements[0].prepend(lastElement);
}
```

_Discussion points to consider (Optional):_
+ What order does an HTML page get loaded in? When, exactly, will a `DOMContentLoaded` listener get fired off?
+ How do you think the `document.all` method works?

---

## Medium

We have a webpage with a hefty comments section; 1000 `li` elements inside of a `ul`! Write a function that, when run, will enable the following behavior:

+ Any time you click an `li`, the content of the `li` should be set to say `I have been clicked.`.

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

How could we do better?

### Better solution

A more reasonable solution would be to add the event listener on the ul. Remember, `Event` objects have a `currentTarget` _and_ a `target` attribute. `target` is the element that triggered the event (e.g., the user clicked on), and `currentTarget` is the element that the event listener is attached to. This concept is called **Event Delegation**.

```js
const ul = document.getElementsByTagName('ul')[0];

ul.addEventListener('click', e => e.target.innerHTML = 'I have been clicked.');
```

---

## Hard

We have an HTML page with a single `Click Me!` button on it. When we click anywhere on the page, two things should happen:

+ The content of the button should now say `Don't Click Me!`
+ The button should be disabled

Clicking anywhere on the page _**again**_ should then return the button to it's original state. I should be able to keep clicking the page, and see the button toggle back and forth.

Additionally, clicking on the button itself should not do anything or trigger any events -- It's just there for fun 😌

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
