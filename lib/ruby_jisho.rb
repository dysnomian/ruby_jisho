require 'ruby_jisho/version'
require 'ruby_jisho/search'
require 'ruby_jisho/result'
require 'ruby_jisho/sense'
require 'ruby_jisho/results'
require 'json'

# Gem namespace module plus convenience methods
module RubyJisho
  module_function

  def search(query)
    Search.new(query).results
  end
end
