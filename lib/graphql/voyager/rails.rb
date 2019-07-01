require "graphql/voyager/rails/engine"
require "graphql/voyager/rails/config"

module Graphql
  module Voyager
    module Rails
      class << self
        attr_accessor :config
      end

      self.config = Config.new
    end
  end
end
