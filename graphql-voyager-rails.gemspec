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

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.0.rc1"

  spec.add_development_dependency "sqlite3"
end
