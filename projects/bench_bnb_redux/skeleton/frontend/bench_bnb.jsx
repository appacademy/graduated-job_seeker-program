//React
import React from 'react';
import ReactDOM from 'react-dom';
//Components
import Root from './components/root';
import configureStore from './store/store';

//The entry file has been left intact for you as a reminder of how
//we can bootstrap the currentUser into our front-end.  Today is not about
//persisting sessions, but it is a good reminder.

document.addEventListener('DOMContentLoaded', () => {
  let store;
  if (window.currentUser) {
    const preloadedState = { session: { currentUser: window.currentUser } };
    //When you write configureStore, be sure to allow it to take in an argument
    //to become the preloaded state.
    store = configureStore(preloadedState);
    delete window.currentUser;
  } else {
    store = configureStore();
  }
  
  // We have applied .getState() to the window for convenience and debugging.
  window.getState = store.getState;

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
