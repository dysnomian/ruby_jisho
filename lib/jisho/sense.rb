module Jisho
  class Sense
    attr_reader :response

    def initialize(response_hash)
      @response = response_hash
    end

    def parts_of_speech
      response.fetch(:parts_of_speech, [""])
        .map {|p| p.downcase.to_sym }
    end

    def to_h
      response
    end

    def keys
      response.keys
    end

    def method_missing(sym, *args, &block)
      if keys.include?(sym)
        response.fetch(sym)
      else
        super
      end
    end
  end
end
