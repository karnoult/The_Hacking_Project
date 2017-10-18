# Monkies!!

Create a `Monkey` class in `lib/monkey.rb`, which has the following attributes:
* `name` - a string, which should be determined by some input
* `species` - a string, which should be determined by some input
* `foods_eaten` - an array, which should be initialized as an empty array

And the following methods:
* `eat(food)` - adds a food (a string) to the list of foods eaten
* `introduce` - introduces self, with name, species, and what it's eaten

## Goal

Run tests using `rspec` from inside the `oop_monkey` folder (not in any subfolders). Write code in your Monkey class to make the tests pass. Before you start, run `bundle install` in the terminal.

Note:
* You should not need to alter the `monkey_spec` file in any way (except for the bonus below).
* You shouldn't need to run `ruby lib/monkey.rb` or use the `ruby` command at all -- just `rspec spec/monkey_spec.rb`.
* You can completely ignore the `.rspec` and `spec_helper.rb` files.

### What is RSpec?

RSpec is a tool for writing automated tests for programs written in ruby. We
write tests in ruby (see `spec/monkey_spec.rb` for example), that describe what
we expect to happen when we use our code (usually classes/objects).

When we run the tests, it compares what our code does to what our tests expect,
and tells us which pass and which fail.

## Bonus

Uncomment the bonus tests in `spec/monkey_spec` and make them pass.
