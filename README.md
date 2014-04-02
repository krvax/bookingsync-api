[![Build Status](https://travis-ci.org/BookingSync/bookingsync-api.png?branch=master)](https://travis-ci.org/BookingSync/bookingsync-api)
[![Code Climate](https://codeclimate.com/github/BookingSync/bookingsync-api.png)](https://codeclimate.com/github/BookingSync/bookingsync-api)

# BookingSync::API

This gem allows Ruby developers to programmatically access https://www.bookingsync.com

## Installation

Add this line to your application's Gemfile:

    gem 'bookingsync-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bookingsync-api

## Usage

Gem assumes that you already have OAuth token for an account.

    api = BookingSync::API.new("OAUTH_TOKEN")
    rentals = api.rentals # => [Sawyer::Resource, Sawyer::Resource]
    rentals.first.name # => "Small apartment"

### Pagination

All endpoints returning a collection of resources can be paginated. There are three ways to do it.

Specify `:per_page` and `:page` params. It's useful when implementing pagination on your site.

    api.bookings(per_page: 10, page: 1) => [Sawyer::Resource, Sawyer::Resource, ...]

Use pagination with a block.

    api.bookings(per_page: 10) do |batch|
      # display 10 bookings, will make one HTTP request for each batch
    end

Fetch all resources (with multiple requests under the hood) and return one big array.

    api.bookings(auto_paginate: true) => [Sawyer::Resource, Sawyer::Resource, ...]

## Gem documentation

See [gem documentation](http://rdoc.info/github/BookingSync/bookingsync-api/master/frames) for more info.

## API documentation

See [API documentation](http://docs.api.bookingsync.com).

## Running specs

    bundle exec rspec

OR

    bundle exec guard

### Recording VCR cassettes

For developing bookingsync-api gem you need OAuth access token. In order to record a cassette,
you need to run spec with below environment variables.

    ACCESS_TOKEN=abc bundle exec rspec

If you want to change a cassette, you need to delete it first.

## Contributing

1. Fork it ( http://github.com/BookingSync/bookingsync-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
