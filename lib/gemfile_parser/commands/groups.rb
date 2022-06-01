# frozen_string_literal: true

module GemfileParser
  module Commands
    class Groups
      class << self
        # @param [String] gem_name
        def call(gem_name:)
          new(gem_name:).call
        end
      end

      def initialize(gem_name:)
        @gem_name = gem_name
      end

      def call
        puts "GemfileParser::Commands::Groups.call(gem_name: #{@gem_name})"
        # GroupAnalyzer.call(@gem_name)
      end
    end
  end
end
