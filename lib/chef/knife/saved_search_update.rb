require "chef/knife"
require_relative "./saved_search_base"

class Chef
  class Knife
    class SavedSearchUpdate < Knife
      include SavedSearchBase

      banner "knife saved search update NAME INDEX QUERY [DESCRIPTION] (options)"

      def run
        ui.fatal("TODO")
      end
    end
  end
end
