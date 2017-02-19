module Jisho
  # A single result from the API response
  class Result
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def keys
      response.keys
    end

    def senses
      response.fetch(:senses)
              .map { |s| Sense.new(s) }
    end

    def to_h
      keys.each_with_object({}) do |k, hash|
        hash[k] = begin
                    send(k)
                  rescue NoMethodError
                    response.fetch(k, nil)
                  end
      end
    end

    def method_missing(sym, *args, &block)
      if keys.include?(sym)
        response.fetch(sym)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      keys.include?(method_name) || super
    end
  end
end
