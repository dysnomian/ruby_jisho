# coding: utf-8
# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'ruby_jisho'
  spec.version       = '0.1.1'
  spec.authors       = ['Liss McCabe']
  spec.email         = ['liss@eristiccode.com']

  spec.summary       = 'Gem adapter for the Jisho search API'
  spec.homepage      = 'https://github.com/dysnomian/ruby_jisho'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\0").reject do |f|
    f.match(%r{^(bin|spec)/})
  end

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec',   '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.49'
  spec.add_development_dependency 'pry',     '~> 0.10'
  spec.add_dependency             'faraday', '~> 0.9'
end
