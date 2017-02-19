# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jisho/version'

Gem::Specification.new do |spec|
  spec.name          = 'jisho'
  spec.version       = Jisho::VERSION
  spec.authors       = ['Liss McCabe']
  spec.email         = ['liss@eristiccode.com']

  spec.summary       = 'Gem adapter for the Jisho search API'
  spec.homepage      = 'https://github.com/dysnomian/jisho'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec',   '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.42'
  spec.add_development_dependency 'pry',     '~> 0.10'
  spec.add_dependency             'faraday', '~> 0.9'
end
