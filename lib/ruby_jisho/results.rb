require 'json'

module RubyJisho
  # Enumberable to store metadata and wrap Result objects cleanly
  class Results
    include Enumerable

    attr_reader :payload

    def initialize(payload)
      @payload = JSON.parse(payload, symbolize_names: true)
    end

    def meta
      payload.fetch(:meta, {})
    end

    def keys
      payload.keys
    end

    def each
      data.each { |r| yield r }
    end

    def method_missing(sym, *args, &block)
      if keys.include?(sym)
        payload.fetch(sym)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      keys.include?(method_name) || super
    end

    private

    def data
      payload.fetch(:data, [{}])
             .map { |r| Result.new(r) }
    end
  end
end
