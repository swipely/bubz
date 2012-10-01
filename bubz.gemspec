$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bubz/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bubz"
  s.version     = Bubz::VERSION
  s.authors     = ["Matt Gillooly"]
  s.email       = ["matt@swipely.com"]
  s.homepage    = "http://github.com/mattgillooly/bubz"
  s.summary     = "Bubz == web stubs"
  s.description = "Stubs web requests to your app for integrations testing your front-end"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "mysql2"
end
