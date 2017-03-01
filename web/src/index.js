import React from 'react';
import ReactDOM from 'react-dom';
import { AppContainer } from 'react-hot-loader';

import App from './containers/App';

const render = () => {
  const rootNode = document.getElementById('root');
  ReactDOM.render((
    <AppContainer>
      <App />
    </AppContainer>
  ), rootNode);
};

if (module.hot) {
  module.hot.accept('./containers/App', render);
}

render();
