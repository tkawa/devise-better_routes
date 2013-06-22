# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise/better_routes/version'

Gem::Specification.new do |spec|
  spec.name          = 'devise-better_routes'
  spec.version       = Devise::BetterRoutes::VERSION
  spec.authors       = ['Toru KAWAMURA']
  spec.email         = ['tkawa@4bit.net']
  spec.description   = %q{Better routes patch for Devise}
  spec.summary       = %q{Better routes patch for Devise}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'devise', '>= 3.0.0.rc'
  spec.add_dependency 'rails', '>= 4.0.0.rc1'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'sqlite3'
end
