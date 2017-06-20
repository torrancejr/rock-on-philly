
import React, { Component } from 'react';

class Venue extends Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <div>
        <a href={`/venues/${this.props.id}`}>
          <img src={this.props.photo}/>
          <h2>{this.props.name}</h2>
          <h3>{this.props.location}</h3>
          <p>{this.props.website}</p>
        </a>
      </div>
    )
  }
}

export default Venue;
