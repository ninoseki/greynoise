# frozen_string_literal: true

module GreyNoise
  module Clients
    class Noise < Client
      #
      # Get more information about a given IP address.
      #
      # @param [String] ip an IP address
      #
      # @return [Hash]
      #
      def context(ip)
        _get("/noise/context/#{ip}") { |json| json }
      end

      #
      # Check whether a given IP address is “Internet background noise”, or has been observed scanning or attacking devices across the Internet.
      #
      # @param [String] ip an IP address
      #
      # @return [Hash]
      #
      def quick(ip)
        _get("/noise/quick/#{ip}") { |json| json }
      end

      #
      # Check whether a set of IP addresses are "Internet background noise", or have been observed scanning or attacking devices across the Internet.
      #
      # @param [Array<String>] *ips a set of IP address
      #
      # @return [Array]
      #
      def multi_quick(*ips)
        params = {
          ips: ips.join(",")
        }
        _get("/noise/multi/quick", params) { |json| json }
      end
    end
  end
end
