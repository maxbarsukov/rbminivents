# rbminivents
This gem allows you to create and emit your events very easily and minimalistic.

## Description
This gem was made under the influence of the tiny JS library [minivents](https://github.com/allouis/minivents) by [allouis](https://github.com/allouis) that I liked. It seemed to me that it would be nice to transfer this to Ruby.

## Getting started

### Requirements

This gem requires Ruby 2.5+. It might work with older versions of Rails though.

### Installation

Add the gem to your `Gemfile`:

```ruby
gem 'rbminivents'
```

and run:

```
bundle install
```

## API
The API is fully (hopefully) compatible with the original one.
So,

`on`: Listen to event

`off`: Stop listening to event

`emit`: Emit event
