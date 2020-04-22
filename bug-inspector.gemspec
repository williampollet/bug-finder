require_relative 'lib/bug_inspector/version'

Gem::Specification.new do |spec|
  spec.name          = "bug-inspector"
  spec.version       = BugInspector::VERSION
  spec.authors       = ["William Pollet"]
  spec.email         = ["polletwilliam@gmail.com"]

  spec.summary       = %q{CLI to search through appsignal records}
  spec.description   = %q{List, search, and retrieve the record you want among appsignal bugs}
  spec.homepage      = "https://github.com/williampollet/bug-inspector"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org/'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/williampollet/bug-inspector"
  spec.metadata["changelog_uri"] = "https://github.com/williampollet/bug-inspector/blob/master/CHANGELOG.md/"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'http'

  spec.add_development_dependency 'fashion_police', '~> 1.2'
  spec.add_development_dependency 'pronto', '~> 0.9.5'
  spec.add_development_dependency 'pronto-rubocop', '~> 0.9.1'
  spec.add_development_dependency 'pronto-simplecov', '~> 0.1.1'
  spec.add_development_dependency 'pry', '~> 0.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.60'
  spec.add_development_dependency 'simplecov', '~> 0.16.1'
end
