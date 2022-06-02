# frozen_string_literal: true

require_relative "gemfile_parser/version"

module GemfileParser
  autoload :AstConverter, "gemfile_parser/ast_converter"
  autoload :Cli, "gemfile_parser/cli"
  autoload :Commands, "gemfile_parser/commands"
  autoload :NodeDetector, "gemfile_parser/node_detector"
  autoload :Node, "gemfile_parser/node"
end
