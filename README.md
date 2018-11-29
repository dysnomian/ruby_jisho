# RubyJisho

[![Build Status](https://www.travis-ci.org/dysnomian/ruby_jisho.svg?branch=master)](https://www.travis-ci.org/dysnomian/ruby_jisho)

A Ruby wrapper for the [Jisho](https://jisho.org) API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_jisho'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_jisho

## Usage

To search Jisho, use the `.search` method:

```ruby
RubyJisho.search("リス")
```

Responses will be in the form of a `RubyJisho::Results` object.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dysnomian/ruby_jisho.

## Thanks

My sincerest thanks to the Jisho team for building such a beautiful and thoughtful tool.
