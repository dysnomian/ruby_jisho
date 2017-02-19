module Jisho
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
        .map {|s| Sense.new(s) }
    end

    def to_h
      keys.reduce({}) do |hash, k|
        hash[k] = begin
                    send(k)
                  rescue NoMethodError
                    response.fetch(k, nil)
                  end
        hash
      end

    end

    def method_missing(sym, *args, &block)
      if keys.include?(sym)
        response.fetch(sym)
      else
        super
      end
    end

    def self.method_missing(*args, &block)
      super
    end
  end
end
