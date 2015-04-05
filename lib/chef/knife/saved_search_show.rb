require "chef/knife"
require_relative "./saved_search_base"

class Chef
  class Knife
    class SavedSearchShow < Knife
      include SavedSearchBase

      banner "knife saved search show NAME (options)"

      def run
        if name_args.length != 1
          show_usage
          ui.fatal("You must specify at least a saved search name")
          exit 1
        end

        output format_for_display(
          Chef::DataBagItem.load(data_bag, name_args[0]).raw_data
        )
      end
    end
  end
end
