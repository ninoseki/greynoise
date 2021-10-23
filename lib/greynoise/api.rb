# frozen_string_literal: true

require "json"

module GreyNoise
  class API
    attr_reader :key

    def initialize(key: nil)
      @key = key
      @key ||= load_from_config
      @key ||= load_from_env

      raise ArgumentError if @key.nil?
    end

    def experimental
      @experimental ||= Clients::Experimental.new(key)
    end

    def meta
      @meta ||= Clients::Meta.new(key)
    end

    def noise
      @noise ||= Clients::Noise.new(key)
    end

    private

    def load_from_env
      ENV["GREYNOISE_API_KEY"]
    end

    def load_from_config
      path = File.expand_path("~/.config/greynoise/config")
      return nil unless File.exist?(path)

      begin
        data = File.read(path)
        json = JSON.parse(data)
        json["api_key"]
      rescue TypeError, JSON::ParserError => _e
        nil
      end
    end
  end
end
