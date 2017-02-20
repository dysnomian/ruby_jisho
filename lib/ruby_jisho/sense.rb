# frozen_string_literal: true

module RubyJisho
  # Wrapper for sense hashes from the Jisho API
  class Sense
    attr_reader :response

    def initialize(response_hash)
      @response = response_hash
    end

    def parts_of_speech
      response.fetch(:parts_of_speech, [''])
              .map { |p| p.downcase.to_sym }
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

    def respond_to_missing?(method_name, include_private = false)
      keys.include?(method_name) || super
    end
  end
end
