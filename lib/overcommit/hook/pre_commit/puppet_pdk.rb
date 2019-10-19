# frozen_string_literal: true

module Overcommit::Hook::PreCommit
  # Runs `pdk validate` against puppet module
  #
  # @see https://puppet.com/docs/pdk/1.x/pdk.html
  class PuppetPdk < Base
    def run
      result = execute(command)

      if result.success?
        :pass
      else
        return [:fail, result.stdout]
      end
    end
  end
end
