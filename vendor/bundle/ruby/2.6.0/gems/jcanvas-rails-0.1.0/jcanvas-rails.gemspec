# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jcanvas/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "jcanvas-rails"
  spec.version       = Jcanvas::Rails::VERSION
  spec.authors       = ["yusdirman"]
  spec.email         = ["yusdirman@gmail.com"]
  spec.summary       = %q{wrap jquery jcanvas into rails asset}
  spec.description   = %q{this gem will implement jcanvas, a jquery plugin for canvas into rails assets pipeline}
  spec.homepage      = "https://github.com/yusdirman/jcanvas-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
