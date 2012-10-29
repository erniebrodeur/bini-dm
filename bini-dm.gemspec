# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bini-dm/version'

Gem::Specification.new do |gem|
  gem.name          = "bini-dm"
  gem.version       = Bini::Dm::VERSION
  gem.authors       = ["Ernie Brodeur"]
  gem.email         = ["ebrodeur@ujami.net"]
  gem.description   = "Extend bini with support for datamapper."
  gem.summary       = " "
  gem.homepage      = "http://www.github.com/erniebrodeur/bini-dm"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_runtime_dependency "bini", "0.3.0"
  gem.add_runtime_dependency "datamapper"
  gem.add_runtime_dependency "dm-types"
  gem.add_runtime_dependency "dm-sqlite-adapter"
end
