import React, {Component} from 'react';
import Venue from './Venue';

class VenuesList extends Component {
  constructor(props){
    super(props)
    this.state = {
      venues: [],
      currentPage: 1,
      venuesPerPage: 9
    }
    this.getData = this.getData.bind(this);
    this.previousPage = this.previousPage.bind(this);
    this.nextPage = this.nextPage.bind(this);
  }

  previousPage(event) {
    let newPage = this.state.currentPage - 1;
    this.setState({ currentPage: newPage })
  }

  nextPage(event) {
    let newPage = this.state.currentPage + 1;
    this.setState({ currentPage: newPage })
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
        this.setState({ venues: body["venues"] })
      })
      .catch(error => console.error(`Error in fetch ${error.message}`));
    }

    componentDidMount(){
      this.getData();
    }

  render() {
     let indexOfLastVenue = this.state.currentPage * this.state.venuesPerPage;
     let indexOfFirstVenue = indexOfLastVenue - this.state.venuesPerPage;

     let currentVenues;

     if (indexOfFirstVenue < 0 ) {
         currentVenues = this.state.venues.slice(0, 10);
       } else if (indexOfLastVenue > this.state.venues.length) {
         currentVenues = this.state.venues.slice(this.state.venues.length - 10, this.state.venues.length)
       } else {
         currentVenues = this.state.venues.slice(indexOfFirstVenue, indexOfLastVenue);
      }

      let newVenues = currentVenues.map((venue, index) => {
        return (
          <Venue
            key={index}
            id={index + 1}
            name={venue.name}
            url={venue.website}
            photo={venue.photo}
            location={venue.location}
          />
        )
      });
    return (
      <div>
        {newVenues}
      </div>
    )
  }
}

export default VenuesList;
