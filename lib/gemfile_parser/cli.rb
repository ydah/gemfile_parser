# frozen_string_literal: true

require "thor"

module GemfileParser
  # Provide CLI sub-commands.
  class Cli < ::Thor
    desc "groups", "Obtains the group(s) to which the specified Gem belongs."
    def groups(gem_name)
      Commands::Groups.call(gem_name:)
    end
  end
end
