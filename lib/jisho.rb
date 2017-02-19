require 'jisho/version'
require 'jisho/search'
require 'jisho/result'
require 'jisho/sense'
require 'jisho/results'
require 'json'

# Gem namespace module plus convenience methods
module Jisho
  module_function

  def search(query)
    Search.new(query).results
  end
end
