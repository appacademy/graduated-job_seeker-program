# Partner A 

## Personal Pitch (1 minute)
Give me a quick rundown of your background.

## React – Contrast and Compare Question (5 minutes)

Other front-end frameworks and libraries exist. What are some examples
of these, and how does React compare/contrast with those?

### Solution

#### jQuery

Like React, jQuery is a library, not a framework. It is the most popular
JavaScript library in use. It wraps up many common vanilla JavaScript
functions and initially gained popularity because it is guaranteed to
behave identically on any browser.

A key contrast: the components rendered by React are a pure function of
the React state, i.e. props and component state. Thus a React developer
only has to think about the state of his app. On the other hand, jQuery
primarily allows you to directly manipulate the DOM, meaning that it is
up to the programer to keep the DOM in sync with the internal state of
an app.

#### Vue

Vue is another front-end library. Like react it uses a virtual DOM and
composable components. Vue's virtual DOM is lighter weight than React,
and Vue is significantly faster, however Vue's developer community is
much smaller than React's, so Vue has a smaller ecosystem of libraries
and plugins.

#### Angular

Angular was initially released in 2009 and is maintained by Google and a
community of developers. It is part of the MEAN stack: the MongoDB
database, Express.js server, Angular.js, and Node.js.

Angular is a framework, not a library like React, and implements a MVVM
framework (Model-View-ViewModel). As a result, it offers perhaps more
functionality out of the box than React. However, it also takes much
more time to master and is criticized in some corners for its lack of
flexibility. Angular 1.0 also struggled to handle larger amounts of
data. With the release of Angular 2.0, its ability to render large
amounts of data in the browser has increased. However, it still loses
out to React in terms of performance.

#### Ember

Like Angular, Ember is a framework and not just a library. It has a
number of customizations that can be added to the app from the Ember CLI
(an idea the Ember team took from Rails!), as well as built in testing
tools. However, it doesn't have a particularly large core team so
development is slow. The community, while vibrant, doesn't produce as
many add-ons. Also, because Ember is a framework, it's harder to
customize.

#### React Native

React Native allows developers to write React apps in javascript and run
them on mobile devices. It was released by Facebook and is also used by
companies like AirBnB and Instagram. It is currently supported by iOS
and Android. Microsoft also has plans to start supporting React Native
apps on Windows devices.

## React – Virtual DOM Question (5 minutes)
What is React’s virtual DOM and why is it used?  How does the diffing
algorithm work?

### Solution

The virtual DOM is a simpler and faster abstraction of the HTML DOM.
While it might be more expensive to manage two DOMs in some respects,
being able to traverse and perform operations on the virtual DOM saves
React from having to have costly interactions with the real one, only
updating it when it absolutely needs to.

When rendering, React creates a tree of React elements. When state or
props update, React then renders a tree of potentially different
elements. The diffing algorithm figures out how to efficiently update
the DOM, removing old DOM nodes and replacing them only when necessary.
We give unique HTML elements unique IDs so the diffing algorithm can
tell them apart.

This algorithm solves the problem of generating the fewest number of
operations needed to manage re-rendering. The React diffing algorithm
manages to run in O(n) time (where n is the number of HTML elements)
using a series of rules to determine when a node will need to be
updated.

## Redux Question (15 minutes)
I want a simple social media app that will store posts.
I would like you to use Redux to store the front-end state.
Each post should have a body, title, and id.
Users should be able to post new posts.
They should also be able to delete old posts and edit existing posts.
Please describe how you would store and work with posts on the front-end
using Redux. In particular,

* Describe the Redux state shape you would implement
* Describe the reducers and action creators you would use

### Solution

The state should look something like this:

```js
{
  posts {
    1 {
      id: 1,
      title: 'A Post',
      body: 'It\'s body'
    },
    2 {
      id: 2,
      title: 'Another Post',
      body: 'It also has a body'
    },
  }
}
```
In particular, the posts should be stored in an object nested under its
Id. They should not be stored in an array (because we will want constant
time lookup).

The action creators should look something like this:

```js
export const ReceivePosts = posts => ({
  type RECEIVE_POSTS,
  posts
});

export const ReceivePost = post => ({
  type RECEIVE_POST,
  post
});

// This action creator should NOT take post as an argument
// The id is enough to identify the post to be deleted, and we always
// want our actions to cary the smallest possible payload
export const DeletePost = id => ({
  type DELETE_POST,
  id
});
```

We will only need one reducer.
The following reducer would work with the above actions:

```js
// It is important to remember the default state, in this case: {}
export default function(state = {}, action) {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_POSTS:
      return action.posts;
    case RECEIVE_POST:
      // Make sure the post is nested under its Id before merging with state
      return Object.assign({}, state, { [action.post.id]: action.post });
    case DELETE_POST:
      let newState = Object.assign({}, state);
      delete newState[action.id];
      return newState;
    default:
      return state;
  }
}
```

If you or your interviewee struggled with this problem, take some time to go through the [Todos project][todos-project] from the main curriculum again to brush up on Redux.

[todos-project]: https://github.com/appacademy/curriculum/tree/master/react/projects/todos

## Debugging Question (15 minutes)

A junior software engineer at our company wrote the following code.
There are at least four problems with it. What are those problems, and
how would you fix them? Also, what does the component do? And can you
give an example of how it could be used?

Feel free to let the interviewee view the code
[here][distance-code-excerpt].

```js
class DistanceTracker extends React.Component {
  constructor(props) {
    this.state = {
      distanceTravelled: 0,
      speed: 1,
    };
  }

  componentDidMount() {
    this.startTracker();
  }

  startTracker() {
    setInterval(() => {
      this.updateDistance();
    }, 1000);
  }

  updateDistance() {
    const { distanceTravelled, speed } = this.state;
    const updatedDistance = distanceTravelled + speed;
    console.log(`Before update, distance was: ${this.state.distanceTravelled}`);
    this.setState({
      distanceTravelled: updatedDistance,
    });
    console.log(`After update, distance is: ${this.state.distanceTravelled}`);
  }

  updateSpeed(value) {
    this.setState({
      speed: this.state.speed + value,
    });
  }

  render() {
    const { children, headerText } = this.props;

    return (
      <div>
        <h2>{headerText}</h2>
        <h3>You are moving north at {this.state.speed} feet per second.</h3>
        <h3>You have travelled north {this.state.distanceTravelled} feet so far.</h3>
        <div>
          <button onClick={updateSpeed(1)}>Go Faster</button>
          <button onClick={updateSpeed(-1)}>Go Slower</button>
        </div>
        {children}
      </div>
    );
  }
}
```

[distance-code-excerpt]: ./distance-tracker.md

#### Solution
Unlike the other frontend problems we've done until now, we won't be running this code in the browser. Instead, one of the key things we are testing is the interviewee's fluency in reading and quickly digesting code in order to debug.

It can be tricky to find errors in code without running it. If the
interviewee is having trouble finding the following problems, try to
nudge them in the right direction. Feel free to allow the interviewee to use the whiteboard for explanations.

##### The Errors

###### Missing `super`

In the constructor, there should be a call of `super(props);` at the
beginning.

###### Infinite Interval

This one can be hard to spot. The `startTracker` method called in the
`componentDidMount` starts a `setInterval`, but when a component is
unmounted, the interval will remain. To fix this, you would want to
assign the interval so that it could be referenced and cleared later:

```js
startTracker() {
  this.interval = setInterval(() => {...}, 1000);
}

componentWillUnmount() {
  clearInterval(this.interval);
}
```

###### Async State Update

Inside `updateDistance`, we have a console log that depends on the state
after the `this.setState(...)`. Because `setState` is asynchronous, it
may or may not return the correct value. Instead, we should pass it as a
callback like so:

```js
this.setState({...}, () => console.log(...));
```

###### Click Callback

The `onClick` should be a callback, not an invoked function. We should
have something like this `onClick={() => this.updateSpeed(1)}`.

##### Usage

This component could be used like this:

```js
<DistanceTracker headerText="This is the header">
  <div>This is a child</div>
</DistanceTracker>
```
