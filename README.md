# GraphQL Voyager Rails

Easily mount [GraphQL Voyager](https://github.com/APIs-guru/graphql-voyager) on your rails app.

![image](https://user-images.githubusercontent.com/1266229/60472004-1cafe500-9c35-11e9-93c0-189af3a6aee7.png)

## Usage

Simply mount GraphQL Voyager in your `config/routes.rb`:

```ruby
if Rails.env.development?
  mount Graphql::Voyager::Rails::Engine, at: "/graphql-voyager", graphql_path: "/graphql"
end

Now you should be able to access GraphQL Voyager at: `http://localhost:3000/graphql-voyager`.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'graphql-voyager-rails'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install graphql-voyager-rails
```

## Contributing
Pull requests are always welcome.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Thanks

Gem originally based off on [GraphiQL Rails](https://github.com/rmosolgo/graphiql-rails) and of course [GraphQL Voyager](https://github.com/APIs-guru/graphql-voyager).
