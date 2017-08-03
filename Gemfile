source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails'
gem 'sqlite3'
gem 'puma'
gem 'bcrypt'

group :development, :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'rspec-activemodel-mocks'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
end

group :development do
  gem 'pry-rails'
  gem 'listen'
end

