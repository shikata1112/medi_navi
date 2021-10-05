# -*- encoding: utf-8 -*-
# stub: jcanvas-rails 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jcanvas-rails".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["yusdirman".freeze]
  s.date = "2017-10-16"
  s.description = "this gem will implement jcanvas, a jquery plugin for canvas into rails assets pipeline".freeze
  s.email = ["yusdirman@gmail.com".freeze]
  s.homepage = "https://github.com/yusdirman/jcanvas-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.11".freeze
  s.summary = "wrap jquery jcanvas into rails asset".freeze

  s.installed_by_version = "3.2.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
  end
end
