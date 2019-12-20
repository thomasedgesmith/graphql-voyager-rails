# frozen_string_literal: true

GraphQL::Voyager::Rails::Engine.routes.draw do
  get "/" => "explorers#show"
end
