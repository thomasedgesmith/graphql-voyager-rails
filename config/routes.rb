# frozen_string_literal: true

Graphql::Voyager::Rails::Engine.routes.draw do
  get "/" => "explorers#show"
end
