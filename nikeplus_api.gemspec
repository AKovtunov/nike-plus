# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nikeplus_api/version'

Gem::Specification.new do |spec|
  spec.name          = "nikeplus_api"
  spec.version       = NikeplusApi::VERSION
  spec.authors       = ["AKovtunov"]
  spec.email         = ["1sasha.sasha1@gmail.com"]
  spec.description   = %q{Nike+ api gem}
  spec.summary       = %q{Nike+ api gem for accessing data}
  spec.homepage      = "https://github.com/AKovtunov/nike-plus"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock", "< 1.12"
  spec.add_development_dependency "httparty"
end
