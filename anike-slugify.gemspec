# frozen_string_literal: true

require_relative "lib/anike/slugify/version"

Gem::Specification.new do |s|
  s.name = "anike-slugify"
  s.version = Anike::Slugify::Version::STRING
  s.author = "Andrey Gusev"
  s.email = "andrey@anix.name"
  s.homepage = "https://github.com/anixd/anike-slugify"
  s.required_ruby_version = ">= 2.7.0"
  s.license = "MIT"

  s.summary = "A library for creating slugs for conlangs, based on Babosa"
  s.description = <<-TEXT
    A library for creating slugs with special support for constructed languages.
    Preserves meaningful punctuation like affixes with dashes and handles various
    apostrophe types. Based on Babosa gem.
  TEXT
  s.test_files = Dir.glob "test/**/*_test.rb"
  s.files = Dir["lib/**/*.rb", "lib/**/*.rake", "*.md", "MIT-LICENSE",
    "Rakefile", "init.rb", "generators/**/*.*", "spec/**/*.*", ".gemtest"]

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", ">= 3.7.0"
  s.add_development_dependency "standard", ">= 1.1.7"
  s.add_development_dependency "simplecov"
  
  s.required_ruby_version = ">= 2.6.0"

  s.cert_chain = [File.expand_path("certs/parndt.pem", __dir__)]
  if $PROGRAM_NAME.end_with?("gem") && ARGV.include?("build") && ARGV.include?(__FILE__)
    s.signing_key = File.expand_path("~/.ssh/gem-private_key.pem")
  end
end
