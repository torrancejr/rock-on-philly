# README

![Build Status](https://codeship.com/projects/afd21e00-31b1-0135-88a3-36beedd22907/status?branch=master)
![Code Climate](https://codeclimate.com/github/meaghanconroy/rock-on-philly.png)
![Coverage Status](https://coveralls.io/repos/meaghanconroy/rock-on-philly/badge.png)

Rock on Philly is a React/Ruby based concert venue website. The application uses a background worker to fetch from the Yelp API to populate an up to date database of all concert venues in the Philadelphia area. Users can sign up and navigate through website to see locations, reviews, and photos of each venue.

Meaghan Conroy, Chris Casella, and Ryan Torrance

Heroku link: https://rock-on-philly.herokuapp.com/

* Features:
  As a user you have the ability
    * Create a profile and sign up for our website.
    * Receive email notifications
    * Sign in and sign out
    * See a list of Philadelphia concert venues
    * Submit reviews on your concert experiences at each venue
    * Upvote/Downvote user reviews

  As an admin you have the ability
    * Edit and delete users
    * Create and delete venues
    * View all users

* Technologies incorporated:
    * Ruby version 2.3.3 (Rails framework)
    * React
    * Ruby on Rails 5.1.1
    * Foundation for styling
    * Devise for user interaction
    * ActiveRecord for database maintenance
    * Yelp API integration (through fetch requests)
    * RSpec/Capybara for testing suite
    * Karma/Enzyme for testing React.
    * Github for collaboration
    * Heroku for deployment
