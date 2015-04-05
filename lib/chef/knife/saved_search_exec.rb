require "chef/knife"
require_relative "./saved_search_base"

class Chef
  class Knife
    class SavedSearchExec < Knife
      include SavedSearchBase

      banner "knife saved search exec NAME (options)"

      def run
        ui.fatal("TODO")
      end
    end
  end
end
