

# REDUX

<img src='https://raw.githubusercontent.com/reactjs/redux/master/logo/logo.png' style='height: 400px; border: none; background-color: rgba(0, 0, 0, 0);'/>

---

## Goals


- What exactly is Redux?
- Why Redux?  Why state management?
- Anatomy of Redux and how to use it
- other tools/the future of react

Note:
Any questions?  Anything about Redux in particular that you want to cover today? Anything about state management you want to cover today?
---

# what is redux?

Note:
White board out the opinions

---

# Redux:
* A predictable state container for JavaScript apps.
* Uses unidirectional data flow to update a read-only state.
* Framework agnostic


Note:
What is a predictable state container?
What is a unidirectional data flow? A read only state?
Can be used with many different front end frameworks or just vanilla JS.

---

# Redux History
* Created by Dan Abramov and Andrew Clark
* Based off of the Flux architecture for application state management
* Was originally a proof of concept for 'time travel' through Flux state.
* Open source

Note:
That idea of 'time travel' is now part of the Redux dev/debugging  tools.
Really cool that Redux is open source.  Check out the source code if you get the chance, it's simpler than you think and pretty cool.

---

## What is state management and why do we need it?

<img src='https://cloud.netlifyusercontent.com/assets/344dbf88-fdf9-42bb-adb4-46f01eedd629/cbd8cb0f-97ee-4da0-8913-ac9892621c91/redux-example-css-tricks-opt.pg_' style='height: 400px'/>

Note:
It's easy to lose control over the when, why, and how of state
Single page apps manage an enormous amount of state especially as they scale.
What is the importance of "predicatble" state management? It removes the 'mutablility' of state when it is just an object and the inconsistency of async operations.  By adhering to the Redux architecture we make sure we know exactly when, how, and why our state changes, making it predictable.

---

### State Management
* Allows us to organize huge application states.
* Helps reduce state mutation 'accidents'
* Coordinates well with asynchronous code and information updates
* Allows us to quicky and efficiently debug because we know the when, the why, and the how of our state changes.

---

# Why Use Redux:
* Relatively easy to start writing and using (once you've set up the boilerplate)
* Lightweight: only 2kb
* Seperation of data organization from presentation.
* App state becomes read only and immutable (we can't directly/accidentally change it)

---

# The three principles of Redux:
* **Single Source of Truth**
* **State is Read Only**
* **Changes are Made Through Pure Functions**

Note:
What do these three things mean?
---

#What are the pieces that make up Redux?

---

## Redux Anatomy
* Actions
* Reducers
* Store

<img src='https://cdn-images-1.medium.com/max/919/1*EdiFUfbTNmk_IxFDNqokqg.png' style='height: 400px' />

Note:
What are each of these parts and what are their jobs?

---

# Actions:
* payloads of information that send data from your application to your store.
* They are the only source of information for the store.
* You send them to the store using store.dispatch().

---

# Action creators
* A function that returns an an action
* Used to dynamically assign information to our actions.
* Envoked Action creators are typically what we pass to store.dispatch()

```javascript
export const receiveCurrentUser = currentUser => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});
```

Note:
Remember that actions only describe the fact that something happened, but don't describe how the application's state changes.

---

# Reducers:
* specify how the application's state changes in response to actions sent to the store.
* are pure functions that takes the previous state and an action, and return the next state.
    ```javascript
(previousState, action) => newState
```
* dictate state shape through reducer design and .combineReducers()

---

### Typical Reducer Architecture:

```javascript
import merge from 'lodash/merge';

import {
  RECEIVE_CURRENT_USER,
} from '../actions/session_actions';

const _nullUser = Object.freeze({
  currentUser: null
});

const sessionReducer = (state = _nullUser, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_CURRENT_USER:
      const currentUser = action.currentUser;
      return merge({}, { currentUser });
    default:
      return state;
  }
};

export default sessionReducer;
```
Note:
Remember that most reducers are simply large switch statements listening to an action's type.
What which reducers do individual actions hit?
What is the importance of lodash/merge?
What is the importance of Object.freeze(state)?

---
#### Protip:

use the following code structure to reduce your combineReducers() boilerplate

```javascript
import { combineReducers } from 'redux'
import * as reducers from './reducers'

const todoApp = combineReducers(reducers)

```

Note:
all of the top level reducers from your ./reducers file will become the keys for the new state object.

---
# The Store

* Holds application state;
* Allows access to state via  getState();
* Allows state to be updated via dispatch(action);
* Handles subscription and unsupscription to state changes via listeners.

Note:
explanation of listeners being handled by Provider in your main app file. this.context

---

### Creating the Store

```
import { createStore } from 'redux'
import todoApp from './reducers'
const store = createStore(todoApp)
```

createStore() takes an optional second argument that acts as a default store:

```
const store = createStore(todoApp, window.STATE_FROM_SERVER)
```

Note:
that optional default state is how we bootstrap the user for persistence of sessions.

---

## Thunk Actions and Middleware


* Thunk middleware allows us to make asynchronous action creators.
* These action creators allow us to communicate with and retrieve persistant data from our back end, or from third party APIs.

---

### Thunk action creators vs action creators:

```javascript
import * as APIUtil from '../util/session_api_util'

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

export const receiveCurrentUser = currentUser => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const receiveErrors = errors => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
});

export const signup = user => dispatch => (
  APIUtil.signup(user).then(user => (
    dispatch(receiveCurrentUser(user))
  ), err => (
    dispatch(receiveErrors(err.responseJSON))
  ))
);
```

Note:
Biggest difference between thunk actions and regular actions?  
Remember that thunk actions ultimately rely on normal actions.

---

### Inserting Thunk and other middleware to your store:

```javascript
import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import logger from 'redux-logger';

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
Note:
applyMiddleware() is the key as the third optional argument to configureStore().

---
## Alternatives to Redux
<div style="width: 50%; margin: auto; display:flex; justify-content: space-around;">
<img src='https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/GraphQL_Logo.svg/2000px-GraphQL_Logo.svg.png' style="height: 100px; border: none; background: none;"/>
<img src='https://cdn-images-1.medium.com/max/1600/1*Hlj8qvb2M0oqjgk36Yz5LA.png' style="height: 100px; border: none; background: none;"/>
<img src='https://subkit.io/icon-apollo.svg' style="height: 100px; border: none; background: none;"/>
</div>

* GraphQL
* MobX
* Apollo

...to name a few

Note:
These libraries offer alternative ways to manage state with there own benefits and tradeoffs. None of them are as widely used as Redux however.
React is also planning a native state management feature in it's next release that may very well make redux obsolete, but we'll have to wait and see.
---

<img src="https://d2eip9sf3oo6c2.cloudfront.net/series/square_covers/000/000/025/full/EGH_Redux-New.png" style="height: 500px;"/>

### Any questions?
