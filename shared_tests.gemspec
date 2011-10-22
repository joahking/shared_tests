# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "shared_tests/version"

Gem::Specification.new do |s|
  s.name        = "shared_tests"
  s.version     = SharedTests::VERSION
  s.authors     = ["Joaquin Rivera Padron"]
  s.email       = ["joahking@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Minimal DSL to write shared tests for Test::Unit}
  s.description = %q{Assert shared behavior of objects easily using: assert_shared_tests :of => :some_shared_behavior }

  s.rubyforge_project = "shared_tests"

  s.add_development_dependency "activesupport"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
