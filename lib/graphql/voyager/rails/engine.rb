module Graphql
  module Voyager
    module Rails
      class Engine < ::Rails::Engine
        isolate_namespace Graphql::Voyager::Rails
      end
    end
  end
end
