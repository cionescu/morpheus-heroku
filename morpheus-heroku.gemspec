# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'morpheus-heroku/version'

Gem::Specification.new do |spec|
  spec.name          = "morpheus-heroku"
  spec.version       = MorpheusHeroku::VERSION
  spec.authors       = ["Catalin Ionescu"]
  spec.email         = ["catalin.ionescu282@gmail.com"]

  spec.summary       = "A set of Rake scrips to automate interactions with Heroku"
  spec.homepage      = "https://github.com/cionescu/morpheus-heroku"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rake", ">= 10.0"

  spec.add_development_dependency "rails", ">= 4.2"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
