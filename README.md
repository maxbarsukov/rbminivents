# rbminivents

> This gem allows you to easily use minimalistic events in Ruby.

![rb.minvents logo](https://github.com/maxbarsukov/rbminivents/blob/master/docs/images/logo.png?raw=true)

## Description
This gem was made under the influence of the tiny JS library [minivents](https://github.com/allouis/minivents) by [allouis](https://github.com/allouis) that I liked.
It seemed to me that it would be quite nice to move something like this to Ruby.

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
This project is similar to the original one in many ways, but some features are not implemented. You can use standard ruby mixins for fully functionality. So,

`on`: Listen to event. Returns handle

`off`: Stop listening to event 

`emit`: Emit event


## Examples
### Standard way
```ruby
require 'rbminivents'

sandbox = RbMinivents::Events.new

sandbox.on(:event) do
  # do stuff
end

sandbox.emit(:event)  # does stuff

sandbox.off(:event)

sandbox.emit(:event)  # does not do stuff
```

### Passing parameters
```ruby
require 'rbminivents'

sandbox = RbMinivents::Events.new

sandbox.on(:event) do |name|
  puts "Hello, #{name}!"
end

sandbox.emit(:event, 'Max')  #=> Hello, Max!
```

```ruby
require 'rbminivents'

sandbox = RbMinivents::Events.new

sandbox.on(:event) do |hash, arr, num, bool|
  puts hash[:name]
  p arr
  puts "5 + #{num} = #{5 + num}"
  puts "It's true!" if bool
end

# max, [1, 2, 3], 5 + 7 = 12
sandbox.emit(:event,
             {name: 'max'},
             [1, 2, 3],
             7,
             false
)
```

### Using Off
```ruby
require 'rbminivents'

sandbox = RbMinivents::Events.new

handler1 = sandbox.on(:event) do
  puts "First Hello!"
end

handler2 = sandbox.on(:event) do
  puts "Second Hello!"
end

# remove just this callback
sandbox.emit(:event)  # => First Hello!\nSecond Hello!

sandbox.off(:event, handler1)
sandbox.emit(:event)  # => Second Hello!

sandbox.off(:event, handler2)
sandbox.emit(:event)  # => nothing...

# re-add listener to show can remove all at once
sandbox.on(:event) do
  puts "Hello!"
end

# remove all
sandbox.off(:event)
sandbox.emit(:event)  # => nothing again
```
