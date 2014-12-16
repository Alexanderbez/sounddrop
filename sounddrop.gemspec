# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sounddrop/version'

Gem::Specification.new do |spec|
  spec.name          = 'sounddrop'
  spec.version       = Sounddrop::VERSION
  spec.authors       = ['Alex Bezobchuk']
  spec.email         = ['abezobchuk@gmail.com']

  spec.summary       = %q{Provides audio and track information about a soundcloud song given a URL}
  spec.description   = %q{A gem that provides audio and track information about a soundcloud song given a URL}
  spec.homepage      = 'https://github.com/Alexanderbez/sounddrop'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb']
  spec.require_paths = ['lib', 'config']

  spec.add_dependency 'soundcloud', '~> 0.3'
  spec.add_dependency 'logbert', '~> 1.0'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'bump', '~> 0.5'
  spec.add_development_dependency 'pry', '~> 0.10'
end
