# encoding: utf-8
require File.expand_path('../lib/silverpop/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'addressable', '~> 2.3'
  gem.add_dependency 'faraday', '~> 0.9.0'
  gem.add_dependency 'faraday_middleware', '~> 0.9.1'
  gem.add_dependency 'hashie', '~> 3.4'
  gem.add_dependency 'builder', '~> 3.0'
  gem.add_dependency 'multi_xml', '~> 0.5'
  gem.add_development_dependency 'oauth2'
  gem.add_development_dependency 'rdiscount'
  gem.add_development_dependency 'yard'
  gem.author      = "Upworthy"
  gem.description = %q{A Ruby wrapper for the SilverPop API}
  gem.email       = 'webmaster@upworthy.com'
  gem.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.files       = `git ls-files`.split("\n")
  gem.homepage    = 'http://www.github.com/upworthy/silverpop'
  gem.licenses    = ['BSD-3-Clause']
  gem.name        = 'silverpop'
  gem.require_paths = ['lib']
  gem.summary     = gem.description
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.version     = SilverPop::VERSION
end
