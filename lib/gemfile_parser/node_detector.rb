# frozen_string_literal: true

module GemfileParser
  class NodeDetector
    class << self
      # @param [String] src_node
      # @param [String] node
      def call(
        src_node:,
        node:
      )
        new(
          src_node: src_node,
          node: node
        ).call
      end
    end

    def initialize(
      src_node:,
      node:
    )
      @src_node = src_node
      @node = node
    end

    def call
      detect
    end

    private

    def detect
      @src_node.children.each do |child|
        node = Node.new(root_node: child)
        break node if node.match?(@node)
      end
    end
  end
end
