require 'rubygems'
require "active_support/inflector"

module SharedTests
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods

    def assert_shared_tests(options = {}, &block)
      shared_test = options.delete(:of)
      include "#{shared_test.to_s.camelize}Tests".constantize
      alias_method :setup_without_shared_test, :setup

      define_method(:setup) do
        setup_without_shared_test
        instance_eval &block
      end
    end
    alias_method :assert_tests, :assert_shared_tests

  end
end
