import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import VenuesList from './components/VenuesList';

$(function() {
  ReactDOM.render(
    <VenuesList />,
    document.getElementById('app')
  );
});
