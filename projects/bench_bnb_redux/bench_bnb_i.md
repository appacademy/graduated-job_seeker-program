# BenchBnB Part 1 - Front-End Auth!

Check out the live demo [here][live-demo]!

[live-demo]: http://aa-benchbnb.herokuapp.com

## Phase 0: Setup

### Setup Checklist

Refer to [the master checklist][checklist] during Bench BnB and your final project.

[checklist]: ../../readings/checklist.md

### Rails Backend

* Create a new rails project using `--database=postgresql` and
`--skip-turbolinks`.
* Set up a `StaticPagesController` with a `root` view containing a
`<main id="root"></main>`.
* Update your `routes.rb` file to root to `static_pages#root`

### Frontend Structure

* Create a `/frontend` folder at the root directory of your project to hold your JavaScript files:

  ```
  frontend
    + actions
    + components
    + reducers
    + store
    + util
    bench_bnb.jsx
  ```

* Run `npm init -y`.
* Run `npm install --save` the following packages:
  * `webpack`
  * `react`
  * `react-dom`
  * `react-redux`
  * `redux`
  * `redux-logger`
  * `babel-core`
  * `babel-loader`
  * `babel-preset-react`
  * `babel-preset-env`
* Create a `webpack.config.js` file.
* Set up your entry file (`bench_bnb.jsx`) to render your app into the `#root` container.

Your entry file might start off looking like the code below:
```js
// frontend/bench_bnb.jsx

import React from 'react';
import ReactDOM from 'react-dom';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});
```

* **Test this rendering setup before moving on.**

## Phase 1: Front-End User Authentication

In this phase, we are going to implement front-end user sign-up and login.
Goodbye Rails views; hello, single-page app!
**Read through the instructions for all of phase 1 before implementing anything.**
This will give you the context to understand each individual step.

**Our authentication pattern must:**
  * sign up new users
  * know who's logged in
  * log users in
  * log them out
  * restrict access to certain routes based on whether someone is logged in

### Auth Backend

+ We want to create a `User` model, `Api::UsersController`, and `Api::SessionsController` with the following endpoints:
  * `[POST] api/users: "users#create" (signup)`,
  * `[POST] api/session: "sessions#create" (login)`,
  * `[DELETE] api/session: "sessions#destroy" (logout)`

Follow the basic pattern you used during the [Rails curriculum][rails], with some key differences:

* Namespace:
  + Your controllers should live under an `Api` namespace.
  * Running `rails g controller api/users` will generate an `Api::UsersController`
* Response Format:
  + Render JSON formatted responses by default.
  * In `routes.rb`, set `defaults: {format: :json}` on your `namespace :api`
* Views:
  + You'll want an **`api/users/show.json.jbuilder`**, which you can use for multiple controller actions.
  + This should delegate to a partial: **`api/users/_user.json.jbuilder`**, which we'll use later.
* `Sessions#destroy`:
  + Render an empty `{}` upon successful logout.
  * Render a `404` message if there is no `current_user` to logout.
* Auth Errors:
  + Render auth errors (e.g. `'invalid credentials'` or `'username already exists'`) in your response with a corresponding error status (usually either `422`, `401`, or `404`).
  * Use `@user.errors` when applicable.
  * **Caution**: Rails will format error responses differently than normal responses.

**Test your routes** using `$.ajax` methods in the console or with Postman before moving on.
You should be able to create a user, log out, and log in.

### `SessionApiUtil`

Create a new file, `util/session_api_util.js` with the following functions:
  * `signup`: should make an AJAX request that creates a new user.
  * `login`: should make an AJAX request that creates a new session.
  * `logout`: should make an AJAX request that deletes the current session.

**NB**: Check out `routes.rb` and run `rails routes` to determine the appropriate URL for each of these requests.

**Test each of your api util functions before moving on!**
To do this, you can import these functions in your entry file and save them to the window (e.g., `window.login = login;`).

### State Shape

We want our app state to hold the `current user` which we'll nest under `session`

If no user is signed in, `session.currentUser` is `null`.
If a user is signed in `session.currentUser` returns information on the user.
App's state might look something like this:

```js
{
  session: {
    currentUser: null,
  },
  errors: {
    session: ["Invalid credentials"]
  }
}
```

or this:

```js
{
  session: {
    currentUser: {
      id: 1,
      username: 'breakfast'
    }
  },
  errors: {
    session: []
  }
}
```

By default, no user is signed in.
Thus `session` should return a `null` `currentUser`.

Hint: Use this default application state as a template for any session information we might receive.

### Session Actions

+ Before we get to the reducer, let's write and export the following action creators in a new file `actions/session_actions.js`:
  * `login(user)` (thunk action creator)
  * `logout()` (thunk action creator)
  * `signup(user)` (thunk action creator)
  * `receiveCurrentUser(currentUser)` (regular action creator)
  * `receiveErrors(errors)` (regular action creator)

+ Don't forget to define and export the corresponding action types as well (e.g., `export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER'`).
+ `logout` won't accept an argument.
`receiveErrors` will take an array.
All other action creators accept a user object. On logout success dispatch `receiveCurrentUser(null)` to remove the current user.

### `sessionReducer`

+ Create a new reducer in a new file `reducers/session_reducer.js` to keep track of our current user.

The `sessionReducer` should listen for 1 action type and respond to it like so:
  * `RECEIVE_CURRENT_USER` - sets `currentUser` to the action's user

Your `sessionReducer` should maintain its own default state.
To do that pass in an object as a default argument to sessionReducer with `currentUser` set to `null`.

Remember to use both `Object.freeze()` and either `Object.assign` or `lodash/merge` to prevent the state from being accidentally mutated.

### `sessionErrorsReducer`

+ Create a new reducer in a new file `reducers/session_errors_reducer.js` to keep track of any error messages.

The `sessionErrorsReducer` should listen for 2 action type and respond to it like so:
+ `RECEIVE_SESSION_ERRORS` - sets `errors` to the action's errors
+ `RECEIVE_CURRENT_USER` - clears the `errors`

### `errorsReducer`

+ Create a new reducer in a new file `reducers/errors_reducer.js` to keep track of any error messages.

This file will be responsible for combining our reducers that handle errors.

* Import `combineReducers` from the `redux` library.
* Also import the `sessionErrorsReducer` function we just created!
* The `errorsReducer` should use `combineReducers` and will only have a single key-value pair for now named `session` which points to the `sessionErrorsReducer`. We will add more error reducers to this later.
  * Remember, the `combineReducers` function accepts a single argument: an object whose properties will represent properties of our application state, and values that correspond to domain-specific reducing functions.
* `export default errorsReducer`.

Your `errorsReducer` should look something like this:

```javascript
// frontend/reducers/errors_reducer.jsx

import { combineReducers } from 'redux';

import sessionErrorsReducer from './session_errors_reducer';

const errorsReducer = combineReducers({
  session: sessionErrorsReducer
});

export default errorsReducer;
```

### `rootReducer`

Create a new file, `reducers/root_reducer.js`.
This file will be responsible for combining our multiple, domain-specific reducers.
It will export a single `rootReducer`.

Use `combineReducers` to create the `rootReducer` with keys for the `sessionReducer` and `errorsReducer`, similarly to how you created the `errorsReducer`.

So far, our default application state should look something like this:

```js
{
  session: {
    currentUser: null,
  },
  errors: {
    session: []
  }
}
```

### The `store`

Set up a `configureStore` method for initializing our Store:

* Create a new file, `/store/store.js`.
* Import `createStore` and `applyMiddleware` from the redux library.
* Import our `rootReducer`, `redux-logger`, and thunk middleware.
Write it yourself, or import the library.
If you use the library don't forget to install it!
* Define a new function, `configureStore`, that accepts a single argument, `preloadedState`.
* `configureStore` should return a new `store` with the `rootReducer` and `preloadedState` passed in.

```javascript
// frontend/store/store.js

import { createStore, applyMiddleware } from 'redux';
import logger from 'redux-logger';
import thunk from 'redux-thunk';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => (
  createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(thunk, logger)
  )
);

export default configureStore;
```

Before moving on, inside the `DOMContentLoaded` callback in `frontend/bench_bnb.jsx` call `configureStore()` and assign the result to the window.

```js
const store = configureStore();
// we don't put the store directly on the window because
// it can be confusing when debugging, sometimes giving you access to state
// when you shouldn't
window.getState = store.getState;
window.dispatch = store.dispatch; // just for testing!
```

Run `window.getState()` in the console and inspect the results.
Your state should look like the default state mentioned above!

## Phase 2: React Router and Session Components

Add routing to our application by running:

```
npm install --save react-router-dom
```

Before we add the `ReactRouter`, we'll need to refactor our component hierarchy a bit.

Define 2 new files at the root of your `frontend/components` folder:

* `frontend/components/App.jsx`
* `frontend/components/root.jsx`

### The `App` component

Create and export a new **functional component** that renders an `<h1>` tag with "Bench BnB" text - this will eventually hold more, but this is all we need for now.
It should look something like this:

```jsx
// frontend/components/App.jsx

import React from 'react';

const App = () => (
  <div>
    <h1>Bench BnB</h1>
  </div>
);

export default App;
```

### The `Root` component

Create and export a **functional component** called `Root`.
It will accept the `store` as a prop, and render routes wrapped by the `Provider`.

```jsx
// frontend/components/root.jsx

import React from 'react';
import { Provider } from 'react-redux';

const Root = ({ store }) => (
  <Provider store={ store }>
    // Router goes here...
  </Provider>
);
```

### React Router

Import `HashRouter` from `react-router-dom` into `root.jsx`, then wrap the `App` component in `HashRouter`.

```javascript
import { HashRouter } from 'react-router-dom';
import App from './App';

const Root = ({ store }) => (
  <Provider store={ store }>
    <HashRouter>
      <App/>
    </HashRouter>
  </Provider>
);
```

Thus `App` will be rendered for all routes in your app.
We'll define our routes within `App`.

### Updating the Entry Point

Let's modify our entry file, `bench_bnb.jsx`, to only import the following:
  * `React` & `ReactDOM`
  * `Root`
  * `configureStore`

In the document-ready callback, you should simply invoke `configureStore` and then render the `Root` component into the `#root` container. Pass the `store` to the `Root` component as a prop.

```js
// frontend/bench_bnb.jsx

import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();

  // TESTING START
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  // TESTING END

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={ store }/>, root);
});
```

### `Greeting` Components

* Create a new react component, `Greeting`, and a container, `GreetingContainer`.

#### `GreetingContainer`
* `GreetingContainer` passes as `props` to the presentational component `currentUser` from the state and the `logout` action creator.
Set up `mapStateToProps` and `mapDispatchToProps` accordingly.

#### `Greeting`
If the user **is logged in**, then the `Greeting` should contain:
  * A welcome message including the user's username
  * A button to logout

If the user **is not logged in**, then the `Greeting` should contain:
  * A [`<Link to>`][link-docs] `/signup`
  * A [`<Link to>`][link-docs] `/login`

Update your `App` component so that it renders the `GreetingContainer` and `<h1>` within a `<header>` tag. It should look like this:

```jsx
import GreetingContainer from './greeting/greeting_container';

const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer />
    </header>
  </div>
);
```

**Test that you can logout from `App.jsx`.**
Navigate to the root url.
From the console, log in a user (`window.dispatch(login(user))`).
Check that clicking the logout button logs out the current user before moving on.

### `SessionForm` Components

To make our React components modular, we will reuse and render the same presentational form component on login and signup. We'll keep this form component ["dumb"](https://medium.com/@dan_abramov/smart-and-dumb-components-7ca2f9a7c7d0), however, so that it doesn't need to know anything about the container or route rendering it.

* Create a container `LoginFormContainer`, another container `SignupFormContainer`, and their controlled component `SessionForm`.

#### `LoginFormContainer and SignupFormContainer`

Each of these containers should provide `SessionForm` with the following props:
+ From `mapStateToProps(state, ownProps)`:
  * `errors` (array) - list of errors from the state
  * `formType` (string): `'login'` or `'signup'`, for each respective container
+ From `mapDispatchToProps(dispatch, ownProps)`:
  * `processForm` (function): dispatching action creators `login` or `signup`, again depending on the container

#### `SessionForm`

The `SessionForm` component should be responsible for a number of tasks:
  * Render a controlled component with `state` governed by user interface.
  For example,

  ```js
  class SessionForm extends React.Component {

    constructor(props) {
      super(props);
      this.state = {
        username: "",
        password: ""
      };
    }

    //...
  }
  ```
  * Invoke the `processForm` prop when the `'Submit'` button is clicked.
    + Define a helper method `handleSubmit(e)` like so:

    ```js
    class SessionForm extends React.Component {
      //...

      handleSubmit(e) {
        e.preventDefault();
        const user = Object.assign({}, this.state);
        this.props.processForm(user);
      }

      //...
    }
    ```

    + Pass it as a callback to your form's `onSubmit`.
  * Render a "Log in" or "Sign up" header based on the `formType` prop.
  * Provide a [`<Link to>`][link-docs] to `/signup` or `/login`, whichever isn't the current address.
  * Render a list of error messages if any are present.
  * Redirect the user to the `/` route if they are logged in.
  Don't forget to export the component [`withRouter`][withRouter-docs]!

### Session Routes

Now it's time to create routes for logging in and signing up.

* Create two new routes in your `App` component for `/login` and `/signup`.
  * Their paths should be `"/login"` and `"/signup"`.
  + One should render the `LoginFormContainer`, the other the `SignupFormContainer`.

Your `App` should now look a lot like this:
```js
const App = () => (    
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer />
    </header>

    <Route path="/login" component={LoginFormContainer} />
    <Route path="/signup" component={SignupFormContainer} />
  </div>
)
```

**Call a TA over and show them your `SessionForm` renders for logging and signing up before moving on!**

[link-docs]: https://github.com/ReactTraining/react-router/blob/master/packages/react-router-dom/docs/api/Link.md
[withRouter-docs]: https://github.com/ReactTraining/react-router/blob/master/packages/react-router/docs/api/withRouter.md

## Phase 3: Bootstrapping the Current User

When our static `root` page loads, our app mounts without being aware of who the current user is.

One solution to this problem is to create another API hook that returns the current user and then fetches that information when the app mounts.
However, since the request would be asynchronous, our app would momentarily have no current user.
This would cause it to briefly render in a 'not-logged-in' state and then re-render when the current user was received, causing a strange, flickering effect.
To circumvent this, we'll 'bootstrap' the current user alongside our HTML when the page initially loads.

#### Edit your `root.html.erb`

Add a `<script></script>` element to the top of your `root.html.erb` file.

Inside your `<script>`, we're going to assign `window.currentUser`.
In order to get the proper value, we'll need to ask our controller for the `current_user` and then `render` that information inside the script tag using `ERB` interpolation.
The result will be a hard-coded assignment in our rendered html that looks something like this:

```html
// root.html.erb

//...
<script type="text/javascript">
    window.currentUser = {"id":3,"username":"sennecy_the_cat"}
</script>

<main id="root"></main>
//...
```

where `{"id": 3, "username": "sennecy_the_cat"}` is inserted via `ERB`.

#### Interpolate `current user`

In your script, assign your `window.currentUser` to an ERB expression:

```js
window.currentUser = <%=  %>
```

Make sure to use `<%= %>` so that the result of your ruby code is rendered into the script (it will eventually return a JSON object).

Inside your erb expression, `render` your jbuilder `_user` partial, passing it the `current_user`.
Specify the whole path, including `.json.jbuilder`, to prevent rails from automatically looking for a HTML partial.
Mark your `render` result `html_safe` to avoid escaping certain characters.
You should get a JS- compatible object to assign to `window.currentUser`.
Add interpolation around your `window.currentUser=` assignment so that it only runs if someone is logged in.
You should have something like this:

```
<!-- root.html.erb -->

<script type="text/javascript">
  <% if logged_in? %>
    window.currentUser = <%= render(
      "api/users/user.json.jbuilder",
      user: current_user
    ).html_safe %>
  <% end %>
</script>
```

Log in, refresh your page, and check out your `elements` in the Dev Tools.
**Verify that the `script` contains an object literal of the current user** and properly assigns `window.currentUser`.

### `preloadedState`

Finally, inside the `DOMContentLoaded` callback in your entry file...
* check to see if there is a `window.currentUser`
* If there is, create a `preloadedState` like below:
* Pass this `preloadedState` to `configureStore`.
* Remove `currentUser` from the `window`
* If there is no `window.currentUser`, then `configureStore`
without any arguments.

Your entry point should now have the following code:

```js
// frontend/bench_bnb.jsx

//...
let store;
if (window.currentUser) {
  const preloadedState = { session: { currentUser: window.currentUser } };
  store = configureStore(preloadedState);
  delete window.currentUser;
} else {
  store = configureStore();
}
//...
```

**Test your code** by logging in and refreshing the page.
You should stay logged in.

### Protecting your front-end routes

Let's make sure users can't visit our `"/login"` or `"/signup"` routes if they are already logged in on the front-end.

* Let's create a `frontend/util/route_util.jsx` file.
In it we will define some custom routes. Our goal is to conditionally render either the component or a [`<Redirect>`][redirect-docs] based on whether a user is logged in.
To do this we'll need to:
  * Check to see if the application state has a `currentUser` property.
  * If true, redirect to `"/"`.
  * Otherwise, render the specified component.

[redirect-docs]: https://github.com/ReactTraining/react-router/blob/master/packages/react-router/docs/api/Redirect.md

Your `<AuthRoute>` should look something like this:

```jsx
// frontend/util/route_util.jsx

//...

const Auth = ({component: Component, path, loggedIn, exact}) => (
  <Route path={path} exact={exact} render={(props) => (
    !loggedIn ? (
      <Component {...props} />
    ) : (
      <Redirect to="/" />
    )
  )}/>
);

const mapStateToProps = state => {
  return {loggedIn: Boolean(state.session.currentUser)};
};

export const AuthRoute = withRouter(connect(mapStateToProps, null)(Auth));
```

Import your `AuthRoute` into `App.jsx` and update the login and signup routes to use `AuthRoute`.

:confetti_ball: You've finished adding front-end user auth to your app! Now let's add benches!

---

Continue to [Part 2](./bench_bnb_ii.md).

[rails]: ../../../rails#readings-after-you-finish-all-videos
[authRoutes]: ../../readings/front_end_auth.md#protected-and-auth-routes
