source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.7'

# Use main development branch of Rails
gem "rails", github: "rails/rails", branch: "main"
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Devise authenticate
gem "devise"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Bootstrap SCSS
gem 'bootstrap', '~> 5.1.0'

# Use PopperJs
gem 'popper_js', '~> 2.9.3'

# Use Jquery
gem 'jquery-rails'

# Use FontAwesome
gem "font-awesome-rails"

# Use Interactor
gem 'interactor', '~> 3.0'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test, :assets, :staging do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "pry-byebug"
  # Permite que o RSpec abra o navegador
  gem "launchy"
  # Roda os testes automaticamente
  gem "guard-rspec"
  gem "reek"
  gem "rspec-activemodel-mocks"
  gem "rspec-collection_matchers"
  gem "rspec-its"
  gem "rspec-rails"
  gem "rspec-retry"
  gem "shoulda-matchers"
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem "solargraph"

  gem "factory_bot_rails", git: "https://github.com/thoughtbot/factory_bot_rails", branch: "master"
  gem "faker",             git: "https://github.com/stympy/faker",                 branch: "master"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem "mock_redis"
  gem "selenium-webdriver"
  gem "shoulda-matchers", require: false
  gem "simplecov", require: false
  gem "simplecov-json", require: false
  gem "vcr", require: false
  gem "webdrivers", require: false
  gem "webmock"
  gem "database_cleaner-active_record"
  gem "rails-controller-testing"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :assets, :production, :staging do
  gem 'therubyracer'
  # Use SCSS for stylesheets
  gem 'sass-rails', '>= 6'
  gem 'uglifier'
end

