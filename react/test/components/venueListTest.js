import Venue from '../../src/components/Venue';
import VenueList from '../../src/components/VenueList';
import { mount } from 'enzyme';
import React from 'react';

describe('VenueList', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <Venue />
    );
  });

  it('should render a VenueList component', () => {
    expect(element.find('VenueList')).toBePresent()
  });
});
