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
gem 'bootstrap'
gem 'bootstrap_form'
gem 'bootstrap_md_editor', github: 'coder2000/bootstrap_md_editor', branch: 'master'
gem 'coffee-rails', '~> 4.2'
gem 'data-confirm-modal'
gem 'ddtrace'
gem 'dragonfly'
gem 'font-awesome-sass'
gem 'friendly_id'
gem 'green_monkey'
gem 'gretel'
gem 'haml'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'le'
gem 'merit', github: 'jnettome/merit'
gem 'paper_trail'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'pundit'
gem 'rails', '~> 5.1.3'
gem 'ransack'
gem 'redcarpet'
gem 'sass-rails', '~> 5.0'
gem 'sorcery'
gem 'tod'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'coveralls', require: false
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pundit-matchers'
  gem 'rspec-expectations'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end

group :development do
  gem 'better_errors'
  gem 'brakeman', require: false
  gem 'capybara'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'meta_request'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
