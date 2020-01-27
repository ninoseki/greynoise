# frozen_string_literal: true

module GreyNoise
  module Clients
    class Experimental < Client
      #
      # GNQL (GreyNoise Query Language) is a domain-specific query language that uses Lucene deep under the hood
      #
      # @param [String] query GNQL query string
      # @param [Integer, nil] size Maximum amount of results to grab
      # @param [Integer, nil] scroll Scroll token to paginate through results
      #
      # @return [Hash]
      #
      def gnql(query, size: nil, scroll: nil)
        params = {
          query: query,
          size: size,
          scroll: scroll
        }.compact
        _get("/experimental/gnql", params) { |json| json }
      end

      #
      # Get aggregate statistics for the top organizations, actors, tags, ASNs, countries, classifications, and operating systems of all the results of a given GNQL query.
      #
      # @param [String] query GNQL query string
      # @param [Integer, nil] count Number of top aggregates to grab
      #
      # @return [Hash]
      #
      def gnql_stats(query, count: nil)
        params = {
          query: query,
          count: count
        }.compact
        _get("/experimental/gnql/stats", params) { |json| json }
      end
    end
  end
end
