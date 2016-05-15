# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rdiff/version'

Gem::Specification.new do |spec|
  spec.name          = 'rdiff'
  spec.version       = Rdiff::VERSION
  spec.authors       = ['Maksym Pugach']
  spec.email         = ['pugach.m@gmail.com']

  spec.summary       = 'A tool to compare files and print the results in custom format'
  spec.homepage      = 'https://github.com/mpugach/rdiff'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.5'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.40'
end
