# frozen_string_literal: true

module GemfileParser
  class Node
    def initialize(
      root_node:
    )
      @root_node = root_node
    end

    def match?(node)
      exist?(@root_node, node)
    end

    attr_reader :root_node

    private

    def exist?(src_node, node)
      return false unless src_node.instance_of?(Parser::AST::Node)
      return true if src_node == node

      src_node&.children&.each do |child|
        return true if exist?(child, node)
      end
      false
    end
  end
end
