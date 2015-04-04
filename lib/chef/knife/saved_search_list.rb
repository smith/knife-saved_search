require "chef/knife"

class Chef
  class Knife
    class SavedSearchList < Knife
      banner "knife saved search list (options)"
      category "saved search"

      deps do
        require "chef/data_bag"
      end

      def run
        config[:saved_search] ||= {}
        config[:saved_search][:data_bag] ||= "saved-searches"

        data_bag = config[:saved_search][:data_bag]
        list = {}

        begin
          list = Chef::DataBag.load(data_bag)
        rescue Net::HTTPServerException => e
          if e.response.code.to_i == 404
            warn "\"#{data_bag}\" data bag does not exist. No saved searches could be found."
          end
        end
        format_list_for_display(list)
      end
    end
  end
end
