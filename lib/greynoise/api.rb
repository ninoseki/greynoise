# frozen_string_literal: true

module GreyNoise
  class API
    def initialize(key: ENV["GREYNOISE_API_KEY"])
      @key = key
    end

    def experimental
      @experimental ||= Clients::Experimental.new(@key)
    end

    def meta
      @meta ||= Clients::Meta.new(@key)
    end

    def noise
      @noise ||= Clients::Noise.new(@key)
    end
  end
end
