# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fuzzier/version'

Gem::Specification.new do |spec|
  spec.name          = "fuzzier"
  spec.version       = Fuzzier::VERSION
  spec.authors       = ["Nicolas Zermati"]
  spec.email         = ["nicoolas25@gmail.com"]

  spec.summary       = %q{Add randomness in your tests suite without loosing your mind}
  spec.description   = %q{Get reproducable failure even when randomizing part of the context of your tests.}
  spec.homepage      = "https://github.com/nicoolas25/fuzzier"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec", "~> 3.8"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake", "~> 10.0"
end
