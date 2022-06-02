# frozen_string_literal: true

module GemfileParser
  module Commands
    class Groups
      class << self
        # @param [String] gem_name
        # @param [String] gemfile_path
        def call(
          gem_name:,
          gemfile_path:
        )
          new(
            gem_name: gem_name,
            gemfile_path: gemfile_path
          ).call
        end
      end

      def initialize(
        gem_name:,
        gemfile_path:
      )
        @gem_name = gem_name
        @gemfile_path = gemfile_path
      end

      def call
        ::Kernel.abort("Specified gem does not exist.") unless include_node

        case include_node.root_node.type
        when :block then ::Kernel.puts(block_group.join(" "))
        when :send then ::Kernel.abort("Please implement here.") end # TODO: Implement
      end

      def include_node
        @include_node ||= NodeDetector.call(
          src_node: AstConverter.call(file_path: @gemfile_path),
          node: AstConverter.call(string: @gem_name)
        )
      end

      def block_group
        if group?(group_nodes)
          groups(group_nodes).map { |group_sym| group_sym.children.first }
        else
          ::Kernel.abort("Please implement here.") # TODO: Implement
        end
      end

      def group_nodes
        @group_nodes ||= include_node.root_node.children.first.children
      end

      def group?(node)
        node.select { |n| n == :group }.any?
      end

      def groups(node)
        node.select { |n| n.instance_of?(Parser::AST::Node) }
      end
    end
  end
end
