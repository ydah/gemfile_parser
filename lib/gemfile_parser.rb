# frozen_string_literal: true

require_relative "gemfile_parser/version"

module GemfileParser
  autoload :Cli, "gemfile_parser/cli"
  autoload :Commands, "gemfile_parser/commands"
end
