# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'akamai_rest_ccu/version'

Gem::Specification.new do |spec|
  spec.name          = "akamai_rest_ccu"
  spec.version       = AkamaiRestCcu::VERSION
  spec.authors       = ["Li Zhenchao"]
  spec.email         = ["zhenchao@strikingly.com"]
  spec.summary       = %q{Ruby library for Akamai CCU restful APIs}
  spec.description   = %q{akamai_rest_ccur is a wrapper around Akamai CCU restful APIs}
  spec.homepage      = "http://github.com/strikingly/akamai_rest_ccu"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency 'httparty', '~> 0.13.1'
end
