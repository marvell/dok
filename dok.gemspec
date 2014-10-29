# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = 'dok'
  spec.version       = '0.0.0'
  spec.authors       = ['marvell']
  spec.email         = ['alex@ndr.su']
  spec.summary       = 'Dok is ...'
  spec.description   = ''
  spec.homepage      = 'https://github.com/marvell/dok'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'thor', '~> 0.19.1'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end