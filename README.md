![dkdeploy](assets/dkdeploy-logo.png)

# Dkdeploy::Cucumber

[![Build Status](https://travis-ci.org/dkdeploy/dkdeploy-cucumber.svg?branch=develop)](https://travis-ci.org/dkdeploy/dkdeploy-cucumber)
[![Gem Version](https://badge.fury.io/rb/dkdeploy-cucumber.svg)](https://badge.fury.io/rb/dkdeploy-cucumber) [![Inline docs](http://inch-ci.org/github/dkdeploy/dkdeploy-cucumber.svg?branch=develop)](http://inch-ci.org/github/dkdeploy/dkdeploy-cucumber)

## Description

This Rubygem `dkdeploy-cucumber` defines Cucumber steps for browser tests.
Tests are run with `capybara` and PhantomJS.

## Installation

Add this line to your application's Gemfile:

    gem 'dkdeploy-cucumber', '~> 4.1'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dkdeploy-cucumber

## Usage

You can see usage examples in the `features` directory.

## Testing

## Prerequisite

`rvm` to test against multiple Ruby versions.

### Running tests

1. Run `bundle exec rubocop`
2. Run `bundle exec cucumber`
3. Run `bundle exec cucumber --profile negative`

## Contributing

1. Install [git flow](https://github.com/nvie/gitflow)
2. If project is not checked out already do git clone `git@github.com:dkdeploy/dkdeploy-cucumber.git`
3. Checkout origin develop branch (`git checkout --track -b develop origin/develop`)
4. Git flow initialze `git flow init -d`
5. Installing gems `bundle update`
6. Create new feature branch (`git flow feature start my-new-feature`)
7. Run tests (README.md Testing)
8. Commit your changes (`git commit -am 'Add some feature'`)
