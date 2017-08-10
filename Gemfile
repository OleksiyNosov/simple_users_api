source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails'
gem 'pg'
gem 'puma'
gem 'bcrypt'
gem 'draper'
gem 'validates_email_format_of'
gem 'rails-observers'
gem 'sidekiq'

group :development, :test do
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'rspec-activemodel-mocks'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
  gem 'shoulda-callback-matchers'
end

group :development do
  gem 'pry-rails'
  gem 'listen'
end

