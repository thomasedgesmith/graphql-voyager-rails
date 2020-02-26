# frozen_string_literal: true

require 'test_helper'

module Graphql
  module Voyager
    module Rails
      class ExplorersControllerTest < ActionController::TestCase
        setup do
          @routes = Graphql::Voyager::Rails::Engine.routes
        end

        teardown do
          Graphql::Voyager::Rails.config.headers = {}
        end

        def graphql_params
          { params: { graphql_path: '/my/endpoint' } }
        end

        test 'renders GraphiQL' do
          get :show, graphql_params
          assert_response(:success)
          assert_includes(@response.body, 'my/endpoint', 'it uses the provided path')
          assert_match(/application-\w+\.js/, @response.body, 'it includes assets')
        end

        test 'it renders headers' do
          Graphql::Voyager::Rails.config.headers['Nonsense-Header'] = ->(_view_ctx) { 'Value' }
          get :show, graphql_params
          assert_includes(@response.body, %(\"Nonsense-Header\":\"Value\"))
          assert_includes(@response.body, %(\"X-CSRF-Token\"))
        end
      end
    end
  end
end
