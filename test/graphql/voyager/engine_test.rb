# frozen_string_literal: true

require "test_helper"

module GraphQL
  module Voyager
    module Rails
      class EngineTest < ActiveSupport::TestCase
        test "it is defined" do
          assert GraphQL::Voyager::Rails::Engine
        end
      end
    end
  end
end
