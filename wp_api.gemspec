# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wp_api/version'

Gem::Specification.new do |gem|
  gem.name          = "wp_api"
  gem.version       = WpApi::VERSION
  gem.authors       = ["Bill DeRusha"]
  gem.email         = ["bill.derusha@gmail.com"]
  gem.description   = %q{Uses the xmlrpc functionality availability in WordPress along with the Wordpress API to allow remote calls to a blog}
  gem.summary       = %q{Makes calls to the Wordpress API}
  gem.homepage      = "http://billderusha.com"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
