lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/study/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-study"
  spec.version       = Ruboty::Study::VERSION
  spec.authors       = ["zeero"]
  spec.email         = ["zeero26@gmail.com"]
  spec.summary       = 'Write a short summary. Required.'
  spec.description   = 'Write a longer description. Optional.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'ruboty', '~> 1.3'
  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'mocha', '~> 1.12'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'rb-fsevent'
  spec.add_development_dependency 'terminal-notifier'
  spec.add_development_dependency 'terminal-notifier-guard'
>>>>>>> 3e48dc3... [2-6] chore: bundle install minitest-reporters, simplecov, guard
end
