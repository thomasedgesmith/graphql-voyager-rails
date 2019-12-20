# frozen_string_literal: true

module GraphQL
  module Voyager
    module Rails
      class Engine < ::Rails::Engine
        isolate_namespace GraphQL::Voyager::Rails
      end
    end
  end
end
