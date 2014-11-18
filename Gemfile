source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.5'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# add datepicker
gem 'bootstrap-datepicker-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# use twitter bootstrap
gem 'less-rails-bootstrap'

# use carrierwave with dropbox to store files
gem 'carrierwave-dropbox'
gem 'mini_magick'

# databaseless models with
gem 'active_attr'

# pagination with kaminari
gem 'kaminari'

# AWS elastic beanstalk
gem 'elastic-beanstalk'

# Authentication
gem 'devise'
gem 'cancancan', '~> 1.8'

# Internationalization
# --------------------

# put the locale in the URL as: deroseforleaders.com/en/articles
gem 'route_translator'

# select jQuery plugin
gem "select2-rails"

# translator center ** My translation center fork
gem 'afalkear_translation_center', '1.8.2'
gem 'audited-activerecord', '~> 4.0.0.rc1'

group :development do
  gem 'git-pivotal-tracker-integration'
  gem 'guard-livereload'
end

group :development, :staging do
  gem 'pg'
  gem 'puma'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'figaro'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :staging, :production do
  gem 'newrelic_rpm', '~> 3.7 '
end

group :staging do
  
end

group :production do
  # mysql 2 for elastic beanstalk
  gem 'mysql2'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
