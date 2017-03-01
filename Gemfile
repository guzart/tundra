source 'https://rubygems.org'

ruby '2.3.3'

gem 'bcrypt', '~> 3.1.7'
gem 'dry-struct'
gem 'dry-types'
# gem 'jbuilder', '~> 2.5'
gem 'knock'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.0'
# gem 'rack-cors'
gem 'rails', '~> 5.0.1'
# gem 'redis', '~> 3.0'
gem 'trailblazer'
gem 'trailblazer-operation'

group :development do
  gem 'annotate'
  # gem 'capistrano-rails'
  gem 'listen', '~> 3.0.5'
  gem 'reek', require: false
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'awesome_print'
  gem 'bullet'
  gem 'bundler-audit', '>= 0.5.0', require: false
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'rspec-rails', '~> 3.5'
end

group :test do
  gem 'capybara-webkit'
  gem 'childprocess'
  gem 'database_cleaner'
  # gem 'formulaic'
  # gem 'launchy'
  # gem 'simplecov', require: false
  # gem 'timecop'
  # gem 'webmock'
end

group :staging, :production do
  gem 'rack-timeout'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
