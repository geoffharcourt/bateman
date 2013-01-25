# Bateman

[![Gem Version](https://badge.fury.io/rb/sydney.png)](http://badge.fury.io/rb/bateman)
[![Build Status](https://travis-ci.org/geoffharcourt/bateman.png?branch=master)](https://travis-ci.org/geoffharcourt/bateman)
[![Dependency Status](https://gemnasium.com/geoffharcourt/bateman.png)](https://gemnasium.com/geoffharcourt/bateman)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/geoffharcourt/bateman)

Bateman [knows cards](http://www.youtube.com/watch?v=qoIvd3zzu4Y). Use Bateman to fetch [Twitter Card](https://dev.twitter.com/docs/cards) data from any URL. `Bateman::TwitterCard` will fall back to [Open Graph](http://ogp.me) or basic HTML defaults if Twitter data is missing.

## Installation

Add this line to your application's Gemfile:

    gem 'bateman'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bateman

## Usage

Pull the Twitter Card data (if available) from a URL:

    Bateman::TwitterCard.new("http://example.com/articles/1")

`Bateman::TwitterCard` has the following attributes available:

    #card
    #creator
    #description
    #image
    #site
    #title
    #url

## Dependencies

Ruby 1.9 is required.

Bateman uses [HTTParty](https://github.com/jnunemaker/httparty) and [Nokogiri](http://nokogiri.org) to pull HTTP and process HTML data.

## Credits

Sydney was created and is maintained by [Geoff Harcourt](http://github.com/geoffharcourt) at [Five Tool Development](http://fivetool.io).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
