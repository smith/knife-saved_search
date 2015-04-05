require "chef/knife"
require_relative "./saved_search_base"

class Chef
  class Knife
    class SavedSearchDelete < Knife
      include SavedSearchBase

      banner "knife saved search delete NAME (options)"

      def run
        if name_args.length != 1
          show_usage
          ui.fatal("You must specify at least a saved search name")
          exit 1
        end

        delete_object(Chef::DataBagItem, name_args[0], "saved_search") do
          rest.delete_rest("data/#{data_bag}/#{name_args[0]}")
        end
      end
    end
  end
end
