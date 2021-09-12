# frozen_string_literal: true

require_relative 'lib/mruby_generate/version'

Gem::Specification.new do |spec|
  spec.name          = 'mruby_generate'
  spec.version       = MRubyGenerate::VERSION
  spec.authors       = ['Shinsuke Nishio']
  spec.email         = ['nishio@densan-labs.net']

  spec.summary       = 'mruby project template generator'
  spec.description   = 'mruby project template generator'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = 'https://github.com/nishio-dens/mruby_generate'
  spec.metadata['source_code_uri'] = 'https://github.com/nishio-dens/mruby_generate'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'thor'
end
