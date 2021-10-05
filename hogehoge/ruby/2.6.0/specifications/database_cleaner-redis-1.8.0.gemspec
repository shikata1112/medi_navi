# -*- encoding: utf-8 -*-
# stub: database_cleaner-redis 1.8.0 ruby lib

Gem::Specification.new do |s|
  s.name = "database_cleaner-redis".freeze
  s.version = "1.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ernesto Tagwerker".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-01-30"
  s.description = "Strategies for cleaning databases using Redis. Can be used to ensure a clean state for testing.".freeze
  s.email = ["ernesto@ombulabs.com".freeze]
  s.homepage = "https://github.com/DatabaseCleaner/database_cleaner-redis".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.11".freeze
  s.summary = "Strategies for cleaning databases using Redis. Can be used to ensure a clean state for testing.".freeze

  s.installed_by_version = "3.2.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<database_cleaner>.freeze, ["~> 1.8.0"])
    s.add_runtime_dependency(%q<redis>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.16"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  else
    s.add_dependency(%q<database_cleaner>.freeze, ["~> 1.8.0"])
    s.add_dependency(%q<redis>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.16"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
