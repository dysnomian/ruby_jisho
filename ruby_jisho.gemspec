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

  spec.add_development_dependency 'bundler', '~> 2.3.9'
  spec.add_development_dependency 'rake',    '~> 13.0.6'
  spec.add_development_dependency 'rspec',   '~> 3.11.0'
  spec.add_development_dependency 'rubocop', '~> 1.26.0'
  spec.add_development_dependency 'pry',     '~> 0.14.1'
  spec.add_dependency             'faraday', '~> 2.2.0'
end
