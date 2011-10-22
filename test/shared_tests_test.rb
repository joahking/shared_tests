require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + '/../lib/shared_tests')

# shared behavior we want to test
module ProgrammingMotherfucker
  def who_am_i?
    "a programming motherfucker"
  end
end

# hacker instances are programming motherfuckers
class Hacker
  include ProgrammingMotherfucker
end

# declaring the shared behavior test examples
module ProgrammingMotherfuckerTests
  def test_is_a_programming_motherfucker?
    assert @me.who_am_i? == "a programming motherfucker"
  end
end

# and the hacker tests
class HackerTest < Test::Unit::TestCase
  include SharedTests

  assert_shared_tests :of => :programming_motherfucker do
    @me = Hacker.new
  end
end
