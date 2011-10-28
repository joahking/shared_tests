require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + '/../lib/shared_tests')

module LengthTests
  def test_length_is_not_zero
    assert @subject.length > 0
  end

  def test_is_not_empty?
    assert false == @subject.empty?
  end
end

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
