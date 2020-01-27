# frozen_string_literal: true

module GreyNoise
  module Clients
    class Meta < Client
      #
      # Get more information about a given IP address.
      #
      # @param [String] ip an IP address
      #
      # @return [Hash]
      #
      def metadata
        _get("/meta/metadata") { |json| json }
      end
    end
  end
end
