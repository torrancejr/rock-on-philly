
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
          <h3>{this.props.name}</h3>
          <h5>{this.props.location}</h5>
          <p>{this.props.website}</p>
        </a>
      </div>
    )
  }
}

export default Venue;
