source 'http://rubygems.org'

gem 'rails', '3.0.0'

#gem 'pg'
#gem 'sqlite3-ruby', :require => 'sqlite3'
gem "mysql"

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

gem 'rails3-generators'
gem "devise"
gem "bson_ext"
gem "haml"
gem "haml-rails"
gem "jquery-rails"

gem "on_the_spot"

# needed for devise (to create haml-views
gem "hpricot"
gem "ruby_parser"

gem 'matthuhiggins-foreigner', :require => 'foreigner'

gem "rcov"

# we need this here, see http://blog.davidchelimsky.net/2010/07/11/rspec-rails-2-generators-and-rake-tasks/
group :development, :test do
  gem "rspec-rails", ">= 2.4.0"
  #gem "rspec-rails", :git => 'http://github.com/rspec/rspec-rails.git'
  gem "autotest"
  gem 'simplecov', :require => false
end

# test-environment gems
group :test, :spec, :cucumber do
  gem "factory_girl_rails"
  gem "rspec",                   ">= 2.4.0"
#  gem "rspec",              :git => "git://github.com/rspec/rspec.git"
#  gem "rspec-core",         :git => "git://github.com/rspec/rspec-core.git"
#  gem "rspec-expectations", :git => "git://github.com/rspec/rspec-expectations.git"
#  gem "rspec-mocks",        :git => "git://github.com/rspec/rspec-mocks.git"
  gem "remarkable",              ">=4.0.0.alpha2"
  gem "remarkable_activemodel",  ">=4.0.0.alpha2"
  gem "remarkable_activerecord", ">=4.0.0.alpha2"
  gem "webrat"
  gem "cucumber"
  gem "database_cleaner"
  gem "cucumber-rails"
end

