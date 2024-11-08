# Run against this stable release
group :development, :test do
  gem 'rspec-rails', '~> 7.0.0'
end

# Or, run against the main branch
# (requires main-branch versions of all related RSpec libraries)
group :development, :test do
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'main'
  end
end
