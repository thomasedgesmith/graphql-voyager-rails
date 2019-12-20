# frozen_string_literal: true

require 'test_helper'

module GraphQL
  module Voyager
    module Rails
      class Test < ActiveSupport::TestCase
        test "truth" do
          assert_kind_of Module, GraphQL::Voyager::Rails
        end
      end
    end
  end
end
