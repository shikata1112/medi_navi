# -*- encoding: utf-8 -*-
# stub: nested_form_fields 0.8.4 ruby lib

Gem::Specification.new do |s|
  s.name = "nested_form_fields".freeze
  s.version = "0.8.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nico Ritsche".freeze]
  s.date = "2020-07-17"
  s.description = "Rails gem for dynamically adding and removing nested has_many association fields in a form.\n                         Uses jQuery and supports multiple nesting levels. Requires Ruby 1.9+ and the asset pipeline.".freeze
  s.email = ["ncrdevmail@gmail.com".freeze]
  s.homepage = "".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.11".freeze
  s.summary = "Rails gem for dynamically adding and removing nested has_many association fields in a form.".freeze

  s.installed_by_version = "3.2.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 3.2.0"])
    s.add_runtime_dependency(%q<coffee-rails>.freeze, [">= 3.2.1"])
    s.add_runtime_dependency(%q<jquery-rails>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.5"])
    s.add_development_dependency(%q<nokogiri>.freeze, ["= 1.6.8.1"])
    s.add_development_dependency(%q<assert_difference>.freeze, [">= 0"])
    s.add_development_dependency(%q<capybara>.freeze, [">= 0"])
    s.add_development_dependency(%q<geckodriver-helper>.freeze, [">= 0"])
    s.add_development_dependency(%q<selenium-webdriver>.freeze, ["> 3.0.5"])
    s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.3.6"])
    s.add_development_dependency(%q<haml>.freeze, [">= 3.1.5"])
    s.add_development_dependency(%q<haml-rails>.freeze, ["~> 0.4.0"])
    s.add_development_dependency(%q<sass-rails>.freeze, ["~> 3.2.3"])
    s.add_development_dependency(%q<test-unit>.freeze, ["= 1.2.3"])
    s.add_development_dependency(%q<public_suffix>.freeze, ["~> 1.4.6"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 3.2.0"])
    s.add_dependency(%q<coffee-rails>.freeze, [">= 3.2.1"])
    s.add_dependency(%q<jquery-rails>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.5"])
    s.add_dependency(%q<nokogiri>.freeze, ["= 1.6.8.1"])
    s.add_dependency(%q<assert_difference>.freeze, [">= 0"])
    s.add_dependency(%q<capybara>.freeze, [">= 0"])
    s.add_dependency(%q<geckodriver-helper>.freeze, [">= 0"])
    s.add_dependency(%q<selenium-webdriver>.freeze, ["> 3.0.5"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3.6"])
    s.add_dependency(%q<haml>.freeze, [">= 3.1.5"])
    s.add_dependency(%q<haml-rails>.freeze, ["~> 0.4.0"])
    s.add_dependency(%q<sass-rails>.freeze, ["~> 3.2.3"])
    s.add_dependency(%q<test-unit>.freeze, ["= 1.2.3"])
    s.add_dependency(%q<public_suffix>.freeze, ["~> 1.4.6"])
  end
end
