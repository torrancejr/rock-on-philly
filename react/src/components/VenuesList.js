import React, {Component} from 'react';
import Venue from './Venue';

class VenuesList extends Component {
  constructor(props){
    super(props)
    this.state = {
      venues: [],
      currentPage: 1,
      venuesPerPage: 9,
      search: ''
    }
    this.getData = this.getData.bind(this);
    this.previousPage = this.previousPage.bind(this);
    this.nextPage = this.nextPage.bind(this);
    this.handleClick = this.handleClick.bind(this);
    this.updateSearch = this.updateSearch.bind(this);
  }

  updateSearch(event) {
    this.setState({ search: event.target.value.substr(0,50) })
    console.log(this.state.search)
  }

  previousPage(event) {
    let newPage = this.state.currentPage - 1;
    this.setState({ currentPage: newPage })
  }

  nextPage(event) {
    let newPage = this.state.currentPage + 1;
    this.setState({ currentPage: newPage })
  }

  handleClick(event){
    this.setState({ currentPage: event.target.id });
  };

  getData() {
    fetch('http://rock-on-philly.herokuapp.com/api/v1/venues.json')
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
     let filtered = this.state.venues.filter(
       (venue) => {
         return venue.name.toLowerCase().indexOf(this.state.search.toLowerCase()) !== -1;
         }
       );

     if (indexOfFirstVenue < 0 ) {
         currentVenues = filtered.slice(0, 10);
       } else if (indexOfLastVenue > filtered.length) {
         currentVenues = filtered.slice(indexOfFirstVenue, indexOfLastVenue)
       } else {
         currentVenues = this.state.venues.slice(indexOfFirstVenue, indexOfLastVenue);
       }

      let finalVenues = currentVenues.map((venue, index) => {
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

      let pageNumbers = [];

      for(let i = 1; i <= Math.ceil(this.state.venues.length / this.state.venuesPerPage); i++) {
      pageNumbers.push(i);
    }

    let renderPageNumbers = pageNumbers.map(number => {
      return(
        <li
          key={number}
          id={number}
          onClick={this.handleClick}
        >
          {number}
        </li>
      )
    })

    return (
      <div>
        <input
           placeholder="Search"
           type="text"
           value={this.state.search}
           onChange={this.updateSearch}
           className="searchBar"
          />
        <div>
          {finalVenues}
        </div>
        <ul>
          {renderPageNumbers}
        </ul>
      </div>
    )
  }
}

export default VenuesList;
