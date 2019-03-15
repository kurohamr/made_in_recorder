# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Core
ruby '2.6.0'
gem 'rails', '~> 5.2.2'

# Middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

# Front/view
gem 'bootstrap-sass', '~> 3.4.1'
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-sass', '~> 5.4.1'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'sassc-rails', '>= 2.1.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# Backend
# gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'carrierwave'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'enum_help'
gem 'geocoder'
gem 'gmaps4rails'
gem 'jbuilder', '~> 2.5'
gem 'mini_magick'

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development do
  gem 'letter_opener_web'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'chromedriver-helper'
end

# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
