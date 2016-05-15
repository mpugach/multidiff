[![Gem Version](https://badge.fury.io/rb/multidiff.svg)](https://badge.fury.io/rb/multidiff)
[![Build Status](https://secure.travis-ci.org/mpugach/multidiff.png?branch=master)](https://travis-ci.org/mpugach/multidiff)
[![Code Climate](https://codeclimate.com/github/mpugach/multidiff/badges/gpa.svg)](https://codeclimate.com/github/mpugach/multidiff)
[![Test Coverage](https://codeclimate.com/github/mpugach/multidiff/badges/coverage.svg)](https://codeclimate.com/github/mpugach/multidiff/coverage)
[![Issue Count](https://codeclimate.com/github/mpugach/multidiff/badges/issue_count.svg)](https://codeclimate.com/github/mpugach/multidiff)

# Multidiff

A simple wrapper for the [diff-lcs](https://github.com/halostatue/diff-lcs) to compare multiple files agains single target.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'multidiff', github: 'mpugach/multidiff', tag: '0.1.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multidiff

## Usage

Run from command line

    $ multidiff path/to/file_1.txt path/to/file_2.txt [path/to/file_3.txt ...]

Or from your app

    require 'multidiff'

    # To return Diff::LCS objects
    Multidiff::Differ.diff([array_of_strings_1, array_of_strings_2, ...])

    # To return array of strings
    Multidiff::Differ.pretty_diff([array_of_strings_1, array_of_strings_2, ...])


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mpugach/multidiff. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

