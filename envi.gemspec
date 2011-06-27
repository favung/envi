# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "envi/version"

Gem::Specification.new do |s|
  s.name        = "envi"
  s.version     = Envi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Maciej Kowalewski", "Tomasz Zurkowski"]
  s.homepage    = "http://github.com/favung/envi"
  s.summary     = "envi-#{Envi::VERSION}"
  s.description = "Best process manager"

  s.rubyforge_project = "envi"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
