# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dkdeploy/cucumber/version'

Gem::Specification.new do |spec|
  spec.name          = 'dkdeploy-cucumber'
  spec.version       = Dkdeploy::Cucumber::Version
  spec.license       = 'MIT'
  spec.authors       = ['Gleb Levitin', 'Timo Webler', 'Johannes Goslar', 'Luka Lüdicke']
  spec.email         = %w[gleb.levitin@dkd.de timo.webler@dkd.de johannes.goslar@dkd.de luka.luedicke@dkd.de]
  spec.description   = 'dkdeploy Cucumber step definitions'
  spec.summary       = 'Cucumber step definitions for browser tests'
  spec.homepage      = 'https://github.com/dkdeploy/dkdeploy-cucumber'
  spec.required_ruby_version = '~> 2.2'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin\/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)\/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rack', '~> 2.0'
  spec.add_development_dependency 'rubocop', '~> 0.48.1'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'capybara', '~> 2.15.1'
  spec.add_development_dependency 'phantomjs', '~> 2.1.1.0'
  spec.add_development_dependency 'poltergeist', '~> 1.16.0'

  spec.add_dependency 'cucumber', '~> 2.4'
  spec.add_dependency 'rspec-expectations', '~> 3.6'
  spec.add_dependency 'launchy', '~> 2.4.3'
end
