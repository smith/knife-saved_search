require "chef/knife"
require_relative "./saved_search_base"

class Chef
  class Knife
    class SavedSearchCreate < Knife
      include SavedSearchBase

      banner "knife saved search create NAME INDEX QUERY [DESCRIPTION] (options)"

      def run
        ui.fatal("TODO")
      end
    end
  end
end
