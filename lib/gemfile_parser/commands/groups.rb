# frozen_string_literal: true

module GemfileParser
  module Commands
    class Groups
      class << self
        # @param [String] gem_name
        # @param [String] gemfile_path
        # @param [Boolean] ignore
        # @param [String] derimiter
        def call(
          gem_name:,
          gemfile_path:,
          ignore:,
          derimiter:
        )
          new(
            gem_name: gem_name,
            gemfile_path: gemfile_path,
            ignore: ignore,
            derimiter: derimiter
          ).call
        end
      end

      def initialize(
        gem_name:,
        gemfile_path:,
        ignore:,
        derimiter:
      )
        @gem_name = gem_name
        @gemfile_path = gemfile_path
        @ignore = ignore
        @derimiter = derimiter
      end

      def call
        ::Kernel.abort("Specified gem does not exist.") unless gem_node

        if @ignore
          ::Kernel.puts(exclude_groups.sort.join(@derimiter))
        else
          ::Kernel.puts(include_groups.sort.join(@derimiter))
        end
      end

      def include_groups
        case gem_node.root_node.type
        when :block then block_group
        when :send then ::Kernel.abort("Please implement here.") end # TODO: Implement
      end

      def exclude_groups
        case gem_node.root_node.type
        when :block then ::Kernel.puts(block_group.sort.join(" "))
        when :send then ::Kernel.abort("Please implement here.") end # TODO: Implement
      end

      def gem_node
        @gem_node ||= NodeDetector.call(
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
        @group_nodes ||= gem_node.root_node.children.first.children
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
