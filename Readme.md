# Shared tests

Shared tests is a minimal DSL for Test::Unit that let's you assert the behavior shared by your objects
easily, using a little pattern and a commodity DSL.


Two objects have common behavior

```ruby
class StringTest < Test::Unit::TestCase
  include SharedTests

  assert_tests :of => :length do
    @subject = "I have length"
  end
end

class ArrayTest < Test::Unit::TestCase
  include SharedTests

  assert_tests :of => :length do
    @subject = [:i, :have, :length]
  end
end
```

The name of the module where you have the tests for the shared behavior must end with the word Tests.

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

And the results

```
$ rake test
(in /home/joahking/dev/rails/shared_test_example/vendor/gems/shared_tests)
/usr/bin/ruby1.8 -I"lib:test" "/usr/lib/ruby/gems/1.8/gems/rake-0.8.7/lib/rake/rake_test_loader.rb" "test/shared_tests_test.rb"
Loaded suite /usr/lib/ruby/gems/1.8/gems/rake-0.8.7/lib/rake/rake_test_loader
Started
....
Finished in 0.000486 seconds.

4 tests, 4 assertions, 0 failures, 0 errors
```

## Installation

   gem install shared_tests

## TODO

* make it use Minitest
* allow to use @variables names in the setups different that those inside ProgrammingMotherfuckerTests
* Travis integration
* collect my programming motherfucker tshirt :-)

## Thanks

* [Jorge Días](https://github.com/diasjorge) for useful tips.

## License

Do something good for mankind license. A good will action would be awesome, a happy thought will do.
