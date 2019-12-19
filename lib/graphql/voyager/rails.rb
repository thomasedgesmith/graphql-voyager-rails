# frozen_string_literal: true

require "rails"

if ActiveSupport::Inflector.method(:inflections).arity == 0
  # Rails 3 does not take a language in inflections.
  ActiveSupport::Inflector.inflections do |inflect|
    inflect.acronym("GraphQL")
  end
else
  ActiveSupport::Inflector.inflections(:en) do |inflect|
    inflect.acronym("GraphQL")
  end
end

require "graphql/voyager/rails/engine"
require "graphql/voyager/rails/config"

module GraphQL
  module Voyager
    module Rails
      class << self
        attr_accessor :config
      end

      self.config = Config.new
    end
  end
end
