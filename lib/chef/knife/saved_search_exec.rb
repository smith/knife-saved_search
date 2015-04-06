require "chef/knife"
require_relative "./saved_search_base"

class Chef
  class Knife
    class SavedSearchExec < Knife
      include SavedSearchBase

      banner "knife saved search exec NAME (options)"

      deps do
        require "chef/knife/search"
      end

      # Use the same options as knife search, except "query"
      Chef::Knife::Search.options.each do |key, value|
        option key, value unless key == :query
      end

      def run
        if name_args.length != 1
          show_usage
          ui.fatal("You must specify at least a saved search name")
          exit 1
        end

        name = name_args[0]
        item = Chef::DataBagItem.load(data_bag, name)

        # Perform a knife search, but with our arguments and options
        Chef::Knife.run(["search", item["index"], item["query"]] + ARGV[4..-1],
                        options)
      end
    end
  end
end
