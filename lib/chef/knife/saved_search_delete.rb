require "chef/knife"

class Chef
  class Knife
    class SavedSearchDelete < Knife
      banner "knife saved search delete NAME (options)"
      category "saved search"

      deps do
        require "chef/data_bag_item"
      end

      def run
        config[:saved_search] ||= {}
        config[:saved_search][:data_bag] ||= "saved-searches"

        data_bag = config[:saved_search][:data_bag]

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
