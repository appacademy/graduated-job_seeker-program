import React from 'react';
import { Provider } from 'react-redux';
import { HashRouter } from 'react-router-dom';

import App from './app';

const Root = ({ store }) => (
  // Remember to comment back in Provider!!! Then remove this comment
  // <Provider store={store}>
    <HashRouter>
      <App />
    </HashRouter>
  // </Provider>
);

export default Root;
