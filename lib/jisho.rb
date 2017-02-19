require "jisho/version"
require "jisho/search"
require "jisho/result"
require "jisho/sense"
require "jisho/results"
require "json"

module Jisho
  extend self

  def search(query)
    Search.new(query).results
  end
end
