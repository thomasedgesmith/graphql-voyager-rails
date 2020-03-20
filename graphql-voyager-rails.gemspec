$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "graphql/voyager/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "graphql-voyager-rails"
  spec.version     = Graphql::Voyager::Rails::VERSION
  spec.authors     = ["Thomas McGoey-Smith"]
  spec.email       = ["hey@thomas.codes"]
  spec.homepage    = "https://github.com/tamcgoey/graphql-voyager-rails"
  spec.summary     = "Explore your Graphql Schema with Graphql Voyager."
  spec.description = "A rails engine for easily mounting Graphql Voyager."
  spec.license     = "MIT"

  spec.required_ruby_version = '>= 2.1.0' # bc optional keyword args

  spec.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  spec.test_files = Dir["test/**/*"]

  spec.add_runtime_dependency "railties"
  spec.add_runtime_dependency "sprockets-rails"

  spec.add_development_dependency "rails"
  spec.add_development_dependency "minitest", "~> 5"
  spec.add_development_dependency "minitest-focus", "~> 1.1"
  spec.add_development_dependency "minitest-reporters", "~>1.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
