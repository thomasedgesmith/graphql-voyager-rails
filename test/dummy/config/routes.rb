Rails.application.routes.draw do
  mount Graphql::Voyager::Rails::Engine => "/graphql-voyager-rails"
end
