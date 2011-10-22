require 'rubygems'
require "active_support/inflector"

module SharedTests
  def self.included(base)
    base.send :extend, InstanceMethods
  end

  module InstanceMethods
    def assert_shared_tests(options = {}, &block)
      shared_test = options.delete(:of)
      include "#{shared_test.to_s.camelize}Tests".constantize

      define_method(:setup) do
        super()
        instance_eval &block
      end
    end
    alias_method :assert_tests, :assert_shared_tests

  end
end
