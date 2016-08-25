# jmespath-jruby

[![Build Status](https://travis-ci.org/burtcorp/jmespath-java.png?branch=master)](https://travis-ci.org/burtcorp/jmespath-jruby)

_If you're reading this on GitHub, please note that this is the readme for the development version and that some features described here might not yet have been released. You can find the readme for a specific version via the release tags ([here is an example](https://github.com/burtcorp/jmespath-jruby/tree/0.1.0))._

An implementation of [JMESPath](http://jmespath.org/) for JRuby.

## Installation

Install it on the command line:

```
$ gem install jmespath-jruby
```

or add it to your `Gemfile`:

```
gem 'jmespath-jruby'
```

## Basic usage

```ruby
require 'jmespath'

jmespath = JmesPath.new
expression = jmespath.compile('foo.bar')
result = expression.search({'foo' => {'bar' => 42}}) # => 42
```

## How to build and run the tests

The best place to see how to build and run the tests is to look at the `.travis.yml` file, but if you just want to get going run:

```
$ bundle
$ rake
```

You can also run all of the `jmespath-java` tests and JMESPath compliance tests with:

```
$ cd ext
$ mvn test
```

# Copyright

© 2016 Burt AB, see LICENSE.txt (BSD 3-Clause).
