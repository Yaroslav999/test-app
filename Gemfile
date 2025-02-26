source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1'

gem 'activesupport', '~> 6.1.0'
gem 'concurrent-ruby', '1.3.4'

# Use pg as the database
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Authorization
gem 'devise'
gem 'devise-bootstrap-views', '~> 1.0'

# Gem for views
gem 'haml-rails'

# Country selecting
gem 'country_select'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Use linter
gem 'rubocop', require: false

# For money system of app
gem 'money-rails'

#image processing
gem 'carrierwave'
gem 'mini_magick'

# breadcrumbs
gem 'gretel'

# pagination
gem 'kaminari'

# background jobs
gem 'sidekiq'
gem 'whenever', require: false

# For views
gem 'bootstrap'
gem 'jquery-rails'

gem 'dotenv-rails'

# encryption
gem 'attr_encrypted'

# Avoid DDoS attack
gem 'rack-attack'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # For tests use rspec
  gem 'rspec-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # check gem issues
  gem 'bundler-audit', require: false
  # check code issues
  gem 'brakeman', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker'
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
