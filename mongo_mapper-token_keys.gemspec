# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongo_mapper/token_keys/version'

Gem::Specification.new do |s|
  s.name        = 'mongo_mapper-token_keys'
  s.version     = '0.1.0'
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Michael Bleigh'
  s.email       = 'mbleigh@mbliehg.com'
  s.summary     = 'Add simple autogenerated tokens to your MongoMapper models.'
  s.description = 'Add simple autogenerated tokens to your MongoMapper models.'

  s.files         = ['mongo_mapper-tokenkeys.rb', 'Gemfile']
  s.test_file     = 'mongomapper-tokenkeys-spec.rb'
  s.require_path  = '.'

  s.add_dependency('mongo_mapper')
  s.add_development_dependency('rspec', ["~> 2.0"])
  s.add_development_dependency('rake')
end

