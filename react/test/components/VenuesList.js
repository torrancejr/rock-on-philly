import VenuesList from '../../src/components/VenuesList';
import { mount } from 'enzyme';
import React from 'react';

describe('VenuesList', () => {
  let website_photo,
      name,
      location,
      wrapper;

  beforeEach(() => {
    wrapper = mount(
      <Elephant
        photo="http://fakeurl.com/venue"
        name="Philamoca"
        location="1900 Walnut St., Philadelphia PA"
      />
    );
  });

  it('should render an img tag', () => {
    expect(wrapper.find('img').length).toEqual(1);
  });

  it('should render an h2 tag with the text property value', () => {
    expect(wrapper.find('h2').text()).toBe('Philamoca');
  });
});
