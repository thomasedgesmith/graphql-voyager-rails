# frozen_string_literal: true

require 'test_helper'

module Graphql
  module Voyager
    module Rails
      class Test < ActiveSupport::TestCase
        test "truth" do
          assert_kind_of Module, Graphql::Voyager::Rails
        end
      end
    end
  end
end
