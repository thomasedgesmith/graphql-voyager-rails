Rails.application.routes.draw do
  mount GraphQL::Voyager::Rails::Engine => "/graphql-voyager-rails"
end
