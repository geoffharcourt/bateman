# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bateman/version'

Gem::Specification.new do |gem|
  gem.name          = "bateman"
  gem.version       = Bateman::VERSION
  gem.authors       = ["Geoff Harcourt"]
  gem.email         = ["geoff.harcourt@gmail.com"]
  gem.description   = %q{A gem for retrieving a webpage's Twitter Card}
  gem.summary       = %q{Bateman retrieves a webpage's Twitter Card, returning the information as stored in the page's header meta tags.}
  gem.homepage      = "http://github.com/geoffharcourt/bateman"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
end