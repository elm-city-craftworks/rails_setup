$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_setup/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_setup"
  s.version     = RailsSetup::VERSION
  s.authors     = ["Jordan Byron"]
  s.email       = ["jordan.byron@gmail.com"]
  s.homepage    = "https://github.com/elm-city-craftworks/rails_setup"
  s.summary     = "Helper methods for better rake setup tasks"
  s.description = "Helper methods for better rake setup tasks"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rainbow'
  s.add_dependency 'highline'
  s.add_dependency "rails", ">= 3.0.0"
end
