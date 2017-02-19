$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "houston/credentials/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name          = "houston-credentials"
  spec.version       = Houston::Credentials::VERSION
  spec.authors       = ["Bob Lail"]
  spec.email         = ["bob.lailfamily@gmail.com"]

  spec.summary       = "Allows capturing users' credentials for third-party integrations and storing them encrypted"
  spec.homepage      = "https://github.com/houston/houston-credentials"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]
  spec.test_files = Dir["test/**/*"]

  spec.add_dependency "houston-core", ">= 0.8.3"

  # for encrypting user credentials
  spec.add_dependency "strongbox", "~> 0.7.2"

  spec.add_development_dependency "bundler", "~> 1.11.2"
  spec.add_development_dependency "rake", "~> 10.0"
end
