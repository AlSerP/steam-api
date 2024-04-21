# frozen_string_literal: true

require_relative "lib/steam-api/version"

Gem::Specification.new do |spec|
  spec.name = "steam-api"
  spec.version = SteamAPI::VERSION
  spec.authors = ["George Pogrebnoi"]
  spec.email = ["al.ser.p@yandex.ru"]

  spec.summary = "Steam web api ruby wrapper."
  spec.description = "Steam web api ruby wrapper."

  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
