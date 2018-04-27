# Partner B

## Weak Sauce (1 minute)
What is your greatest weakness as a software engineer? What are you doing to overcome that weakness?

## React Component Lifecycle (5 minutes)
What happens during the lifecycle of a React component?

### Solution
(taken from [codementor](https://www.codementor.io/reactjs/tutorial/5-essential-reactjs-interview-questions))
#### High-level component lifecycle
At the highest level, React components have lifecycle events that fall into three general categories:

1. Initialization
2. State/Property Updates
3. Destruction

Every React component defines these events as a mechanism for managing its properties, state, and rendered output. Some of these events only happen once, others happen more frequently; understanding these three general categories should help you clearly visualize when certain logic needs to be applied.

For example, a component may need to add event listeners to the DOM when it first mounts. However, it should probably remove those event listeners when the component unmounts from the DOM so that irrelevant processing does not occur.
```js
class MyComponent extends React.Component {
    // when the component is added to the DOM...
    componentDidMount() {
        window.addEventListener(‘resize’, this.onResizeHandler);
    }

    // when the component is removed from the DOM...
    componentWillUnmount() {
        window.removeEventListener(‘resize’, this.onResizeHandler);
    }

    onResizeHandler() {
        console.log(‘The window has been resized!’);
    }
}
```

#### Low-level component lifecycle
![specific component lifecycles](./images/component-lifecycle.png)

Within these three general buckets exist a number of specific lifecycle hooks — essentially abstract methods — that can be utilized by any React component to more accurately manage updates. Understanding how and when these hooks fire is key to building stable components and will enable you to control the rendering process (improving performance).

Take a look at the diagram above. The events under “Initialization” only happen when a component is first initialized or added to the DOM. Similarly, the events under “Destruction” only happen once (when the component is removed from the DOM). However, the events under “Update” happen every time the properties or state of the component change.

For example, components will automatically re-render themselves any time their properties or state change. However, in some cases a component might not need to update — so preventing the component from re-rendering might improve the performance of our application.

```js
class MyComponent extends React.Component {

    // only re-render if the ID has changed!
    shouldComponentUpdate(nextProps, nextState) {
        return nextProps.id === this.props.id;
    }
}
```
**For more specific details**, go through [React docs on component lifecycle](https://facebook.github.io/react/docs/react-component.html)

## Using React (10 mins)
Say that you have an index.html page, what do you you need to do to use React on your site?

What do you need to do with React to interact with elements on the page and how does it do that?

### Solution
Part A: npm install the correct packages for React and Babel (why?), set up webpack and entry file, OR...use a CDN to just give you the libraries on your HTML page and write your code! [How to add React to a simple HTML file](https://medium.com/@to_pe/how-to-add-react-to-a-simple-html-file-a11511c0235f)

Part B: From within a component class, this.refs gives you an object containing key:value pairs of refs and DOM nodes that you will have created within this class. When you create an HTML element in your code, you can pass it a ref prop.

```render: function() { return <input placeholder='Email' ref='email' onFocus={this.onEmailFocus} />; },```

```onEmailFocus: function() { this.refs.email.blur(); }```

You can also get references to the top level node returned by any component's render function by calling

```ReactDOM.findDOMNode(componentInstance)```

[React.js By Example: Interacting with the DOM](http://jamesknelson.com/react-js-by-example-interacting-with-the-dom/)
