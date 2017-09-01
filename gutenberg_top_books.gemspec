# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gutenberg_top_books/version"

Gem::Specification.new do |spec|
  spec.name          = "gutenberg_top_books"
  spec.version       = GutenbergTopBooks::VERSION
  spec.authors       = ["Cecily Downs"]
  spec.email         = ["cecily.downs@gmail.com"]

  spec.summary       = %q{CLI interface for viewing the most downloaded books on Project Gutenberg.}
  spec.description   = %q{A CLI interface that allows the user to view the most downloaded books on Project Gutenberg in the specified time range and request a download link.}
  spec.homepage      = "https://github.com/Cecily2/gutenberg-top-books-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
