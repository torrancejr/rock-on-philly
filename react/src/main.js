import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import VenuesList from './components/VenuesList';


$(function() {
  let app = document.getElementById( 'app' );
  if (app) {
  ReactDOM.render(
      <VenuesList />,
      app
    );
  };
});
