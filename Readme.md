# Shared tests

Shared tests is an assertion for Test::Unit that let's you assert the behavior shared by your objects in a more readable way.

Two objects have common behavior

```ruby
class StringTest < Test::Unit::TestCase
  include SharedTests

  def setup
    @subject = "I have length"
  end

  assert_tests :of => :length
end

class ArrayTest < Test::Unit::TestCase
  include SharedTests

  def setup
    @subject = [:i, :have, :length]
  end

  assert_shared_tests :of => :length
end
```

The name of the module where you have the tests for the shared behavior must end with the word Tests. Also make sure you have set up all variables used in the examples.

```ruby
module LengthTests
  def test_length_is_not_zero
    assert @subject.length > 0
  end

  def test_is_not_empty?
    assert false == @subject.empty?
  end
end
```

It's all about readability, the same without using the assertion would be

```ruby
class StringTest < Test::Unit::TestCase
  include SharedTests

  def setup
    @subject = "I have length"
  end

  include LengthTests
end
```

And the results

```
$ rake test
/home/joahking/.rvm/rubies/ruby-1.8.7-p302/bin/ruby -I"lib:test" -I"/home/joahking/.rvm/gems/ruby-1.8.7-p302/gems/rake-0.9.0/lib" "/home/joahking/.rvm/gems/ruby-1.8.7-p302/gems/rake-0.9.0/lib/rake/rake_test_loader.rb" "test/shared_tests_test.rb"
Loaded suite /home/joahking/.rvm/gems/ruby-1.8.7-p302/gems/rake-0.9.0/lib/rake/rake_test_loader
Started
....
Finished in 0.00036 seconds.

4 tests, 4 assertions, 0 failures, 0 errors
```

## Installation

   gem install shared_tests

## TODO

* make it use Minitest
* make it work with shoulda?

## Build status

[![Build Status](https://secure.travis-ci.org/joahking/shared_tests.png)](http://travis-ci.org/joahking/shared_tests)

## Thanks

* [Jorge Días](https://github.com/diasjorge) for useful tips and pair programming this.

## License

Do something good for mankind license. A good will action would be awesome, a happy thought will do.
