lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/study/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-study"
  spec.version       = Ruboty::Study::VERSION
  spec.authors       = ["zeero"]
  spec.email         = ["zeero26@gmail.com"]
  spec.summary       = 'TODO: Write a short summary. Required.'
  spec.description   = 'TODO: Write a longer description. Optional.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'ruboty'
  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
end
