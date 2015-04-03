# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'knife/saved_search/version'

Gem::Specification.new do |spec|
  spec.name          = "knife-saved_search"
  spec.version       = Knife::SavedSearch::VERSION
  spec.authors       = ["Nathan L Smith"]
  spec.email         = ["smith@chef.io"]
  spec.summary       = %q{Knife plugin for doing saved searches}
  spec.description   = %q{Allows one to save searches against a Chef server and execute them later.}
  spec.homepage      = "https://github.com/smith/knife-saved_search"
  spec.license       = "Apache-2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "chef", ">= 12"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
