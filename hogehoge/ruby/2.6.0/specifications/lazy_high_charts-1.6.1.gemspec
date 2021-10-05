# -*- encoding: utf-8 -*-
# stub: lazy_high_charts 1.6.1 ruby lib

Gem::Specification.new do |s|
  s.name = "lazy_high_charts".freeze
  s.version = "1.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Miguel Michelson".freeze, "Deshi Xiao".freeze]
  s.date = "2020-07-29"
  s.description = "    lazy_high_charts is leading edge rubyist render charts gem for displaying Highcharts graphs.\n".freeze
  s.email = ["miguelmichelson@gmail.com".freeze, "xiaods@gmail.com".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "CHANGELOG.md".freeze]
  s.files = ["CHANGELOG.md".freeze, "README.md".freeze]
  s.homepage = "https://github.com/michelson/lazy_high_charts".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "3.2.11".freeze
  s.summary = "rubyist way to render variant chart by highcharts without write javascript right now, rails gem library.".freeze

  s.installed_by_version = "3.2.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, [">= 1.0"])
    s.add_runtime_dependency(%q<hash-deep-merge>.freeze, [">= 0"])
  else
    s.add_dependency(%q<bundler>.freeze, [">= 1.0"])
    s.add_dependency(%q<hash-deep-merge>.freeze, [">= 0"])
  end
end
