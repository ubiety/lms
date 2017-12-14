source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'active_link_to'
gem 'acts_as_paranoid', github: 'ActsAsParanoid/acts_as_paranoid'
gem 'avatar_magick'
gem 'baby_squeel'
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap', '~> 4.0.0.beta2'
gem 'bootstrap_form'
gem 'bootstrap_md_editor', github: 'coder2000/bootstrap_md_editor', branch: 'master'
gem 'coffee-rails', '~> 4.2'
gem 'data-confirm-modal'
gem 'dragonfly'
gem 'envkey'
gem 'font-awesome-sass'
gem 'friendly_id'
gem 'graphql'
gem 'green_monkey'
gem 'gretel'
gem 'haml'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jwt'
gem 'kaminari'
gem 'le'
gem 'merit', github: 'jnettome/merit'
gem 'paper_trail'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'pundit'
gem 'rails', '~> 5.1.3'
gem 'rails-settings-cached'
gem 'ransack'
gem 'react-rails'
gem 'redcarpet'
gem 'representable'
gem 'responders'
gem 'routing-filter'
gem 'sass-rails', '~> 5.0'
gem 'sorcery', '~> 0.11.0'
gem 'tod'
gem 'translation'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'validates_email_format_of'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'coveralls', require: false
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pundit-matchers'
  gem 'rspec-expectations'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'sqlite3'
  gem 'tzinfo-data'
end

group :development do
  gem 'better_errors'
  gem 'brakeman', require: false
  gem 'capybara'
  gem 'graphiql-rails'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'meta_request'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
