source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

#Core
ruby '2.6.0'
gem 'rails', '~> 5.2.2'

#Middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

#Front/view
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'

#Backend
gem 'jbuilder', '~> 2.5'
# gem 'bcrypt', '~> 3.1.7'
gem 'carrierwave'
gem 'mini_magick'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'enum_help'
gem 'faker'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'gmaps4rails'
gem "geocoder"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'launchy'
  gem 'dotenv-rails'
  gem 'bullet'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
