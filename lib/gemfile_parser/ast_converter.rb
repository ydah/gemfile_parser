# frozen_string_literal: true

require "parser/ruby32"

module GemfileParser
  class AstConverter
    class << self
      # @param [String] file_path
      # @param [String] string
      # @return [Array<String>]
      def call(
        file_path: nil,
        string: nil
      )
        new(
          file_path:,
          string:
        ).call
      end
    end

    def initialize(
      file_path:,
      string:
    )
      @file_path = file_path
      @string = string
    end

    def call
      to_ast
    end

    private

    # @return [Parser::AST::Node]
    def to_ast
      if @file_path
        Parser::Ruby32.parse_file(@file_path)
      elsif @string
        Parser::Ruby32.parse("'#{@string}'")
      else
        raise "Could not find file_path or string"
      end
    end
  end
end
