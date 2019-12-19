# frozen_string_literal: true

module GraphQL
  module Voyager
    module Rails
      class ExplorersController < ActionController::Base
        helper_method :graphql_endpoint_path

        def show
        end

        def graphql_endpoint_path
          params[:graphql_path] || raise(%|You must include `graphql_path: "/my/endpoint"` when mounting Graphql::Voyager::Rails::Engine|)
        end
      end
    end
  end
end
