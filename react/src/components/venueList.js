import React, { Component } from 'react';
import Venue from './venue';

class VenueList extends Component {
  constructor(props) {
    super(props)
      this.state = {
        venues: [],
        currentPage: 1,
        venuesPerPage: 9
      }
    this.getData = this.getData.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    this.setState({ currentPage: event.target.id })
  }

  getData() {
    fetch('http://localhost:3000/api/v1/venues.json')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} ($response.statusText)`,
            error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({ venues: body })
      })
      .catch(error => console.error(`Error in fetch ${error.message}`));
  }

  componentDidMount() {
    this.getData()
  }
  render() {

    return(

    )
  }
}

export default VenueList;
