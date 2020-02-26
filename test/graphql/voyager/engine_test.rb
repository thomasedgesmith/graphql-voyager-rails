# frozen_string_literal: true

require "test_helper"

module Graphql
  module Voyager
    module Rails
      class EngineTest < ActiveSupport::TestCase
        test "it is defined" do
          assert Graphql::Voyager::Rails::Engine
        end
      end
    end
  end
end
