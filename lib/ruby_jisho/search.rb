require 'faraday'

module RubyJisho
  # Queries the Jisho API and returns a Results object
  class Search
    attr_reader :query

    def initialize(query)
      @query = query
    end

    def results
      @results ||= Results.new(json_response)
    end

    private

    def json_response
      @json_response ||= Faraday.get(endpoint + query).body
    end

    def endpoint
      'http://jisho.org/api/v1/search/words?keyword='
    end
  end
end
