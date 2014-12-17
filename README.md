[![Code Climate](https://codeclimate.com/github/deniseyu/octochat/badges/gpa.svg)](https://codeclimate.com/github/deniseyu/octochat)
# Chitter Challenge

## Overview

This web app was built during Week 4 of Makers Academy. It is [deployed on Heroku](https://totoro-chitter.herokuapp.com).

Chitter is a public stream of 'peeps' -- short, 140-or-fewer-character-long messages broadcasted to the world. It may slightly resemble a popular social networking tool known as Twitter.

When using Chitter, a user can:

* Sign up, sign in, and sign out
* Post peeps to Chitter when logged in
* View all peeps in chronological order without logging in

## Preview

![meow](https://raw.github.com/deniseyu/octochat/master/app/public/images/screenshot.png)

## To Use

Clone the repository:
```
git clone git@github.com:deniseyu/octochat.git
cd octochat
```
Install dependencies and start server:
```
bundle install
rackup
```

To test, run 'rspec' from the command line.

## Technologies

* Ruby
* Sinatra
* RSpec
* Capybara
* Datamapper
* PostgresQL
* BCrypt
* HTML5
* CSS3

## Learning Objectives

* Behavior-driven testing in Capybara/RSpec
* User interface and front-end design
* Relational databases with a object-relational mapper
* User login handling in Sinatra and BCrypt
