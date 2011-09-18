require File.expand_path("../lib/padrino/sprockets/version.rb", __FILE__)

Gem::Specification.new do |gem|
  gem.name = "padrino-sprockets"
  gem.version = Padrino::Sprockets::VERSION
  gem.description = "Padrino with Sprockets"
  gem.summary = gem.description
  gem.authors = ["Night Sailer"]
  gem.email = ["nightsailer@gmail.com"]
  gem.date = Time.now.strftime '%Y-%m-%d'
  gem.homepage = "https://github.com/nightsailer/padrino-sprockets"
  gem.files = `git ls-files`.strip.split("\n")
  gem.add_dependency 'sprockets'
end