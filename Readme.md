# Shared tests

Shared tests is a minimal DSL for Test::Unit that let's you assert the behavior shared by your objects
easily, using a little pattern and a commodity DSL.

## Installation

   gem install shared_tests

## Usage

You want to test this behavior shared by some of your objects.

```ruby
module ProgrammingMotherfucker
  def what_am_i?
    "a programming motherfucker"
  end
end
```

Your Hacker and SysAdmin instances are programming motherfuckers.

```ruby
class Hacker
  include ProgrammingMotherfucker
end

class SysAdmin
  include ProgrammingMotherfucker
end
```

To test it first the little pattern: declare the shared behavior test examples inside a module,
the trick here is to add the `Tests` word as the end of the module name.

```ruby
module ProgrammingMotherfuckerTests
# write your tests as usual
  def test_is_a_programming_motherfucker?
    assert @me.what_am_i? == "a programming motherfucker"
  end
end
```

Now you can assert that a hacker is a programming motherfucker,

```ruby
class HackerTest < Test::Unit::TestCase
  include SharedTests # include the shared_tests support

  assert_shared_tests :of => :programming_motherfucker do
  # this is the setup of the shared tests
    @me = Hacker.new
  end
end
```

and sysadmins also,

```ruby
class SysAdminTest < Test::Unit::TestCase
  include SharedTests

  # or you can use the shorter version
  assert_tests :of => :programming_motherfucker do
    @me = SysAdmin.new
  end
end
```

## TODO

* make it use Minitest
* allow to use @variables names in the setups different that those inside ProgrammingMotherfuckerTests
* Travis integration
* collect my programming motherfucker tshirt :-)

## Thanks

* [Jorge Días](https://github.com/diasjorge) for useful tips.

## License

Do something good for mankind license. A good will action would be awesome, a happy thought will do.
