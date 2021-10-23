# frozen_string_literal: true

require "json"
require "net/https"
require "uri"

module GreyNoise
  module Clients
    class Client
      HOST = "api.greynoise.io"
      VERSION = "v2"
      BASE_URL = "https://#{HOST}/#{VERSION}".freeze

      attr_reader :key

      def initialize(key)
        @key = key
      end

      private

      def url_for(path)
        URI(BASE_URL + path)
      end

      def https_options
        if proxy = ENV["HTTPS_PROXY"] || ENV["https_proxy"]
          uri = URI(proxy)
          {
            proxy_address: uri.hostname,
            proxy_port: uri.port,
            proxy_from_env: false,
            use_ssl: true
          }
        else
          { use_ssl: true }
        end
      end

      def request(req)
        Net::HTTP.start(HOST, 443, https_options) do |http|
          req["key"] = key

          response = http.request(req)

          code = response.code.to_i
          body = response.body
          json = JSON.parse(body) if response["Content-Type"].to_s.include?("application/json")

          case code
          when 200
            if json
              yield json
            else
              yield body
            end
          else
            status = json ? json["status"] : body
            raise Error, "Unsupported response code returned: #{code} - #{status}"
          end
        end
      end

      def _get(path, params = {}, &block)
        uri = url_for(path)
        uri.query = URI.encode_www_form(params)
        get = Net::HTTP::Get.new(uri)

        request(get, &block)
      end
    end
  end
end
