# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongo_mapper/token_keys/version'

Gem::Specification.new do |s|
  s.name        = 'mongo_mapper-token_keys'
  s.version     = MongoMapper::TokenKeys::VERSION
  s.author      = 'Michael Bleigh'
  s.email       = 'mbleigh@mbleigh.com'
  s.summary     = 'Add simple autogenerated tokens to your MongoMapper models.'
  s.description = 'Add simple autogenerated tokens to your MongoMapper models.'
  s.homepage    = 'https://github.com/mbleigh/mongo_mapper-token_keys'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split($/)                                                                                                                                                                                                      
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }                                                                                                                                                                           
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})                                                                                                                                                                                   
  s.require_paths = ["lib"]

  s.add_dependency('mongo_mapper')
  s.add_development_dependency('rspec', ["~> 2.0"])
end

