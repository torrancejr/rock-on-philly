import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';

$(function() {
  let appdiv = document.getElementById('app')
  if (appdiv) {
    ReactDOM.render(
      <h1>Boo yaa</h1>,
      appdiv
    );
  }
});
