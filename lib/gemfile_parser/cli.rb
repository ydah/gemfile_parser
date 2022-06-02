# frozen_string_literal: true

require "thor"

module GemfileParser
  # Provide CLI sub-commands.
  class Cli < ::Thor
    desc "groups", "Obtains the group(s) to which the specified Gem belongs."
    option(:ignore, default: false, type: :boolean)
    option(:derimiter, default: " ", type: :string)
    def groups(gem_name)
      Commands::Groups.call(
        gem_name: gem_name,
        gemfile_path: "Gemfile",
        ignore: options[:ignore],
        derimiter: options[:derimiter]
      )
    end
  end
end
