require "chef/knife"
require_relative "./saved_search_base"

class Chef
  class Knife
    class SavedSearchUpdate < Knife
      include SavedSearchBase

      banner "knife saved search update NAME INDEX QUERY [DESCRIPTION] (options)"

      def run
        if name_args.length < 3 || name_args.length > 4
          show_usage
          ui.fatal("You must specify a saved search name, index, and query, with an optional description")
          exit 1
        end

        name, index, query, description = name_args

        item = Chef::DataBagItem.load(data_bag, name)
        item["index"] = index
        item["query"] = query
        item["description"] = description if description
        item.save
        msg "Updated saved_search[#{name}]"
      end
    end
  end
end
