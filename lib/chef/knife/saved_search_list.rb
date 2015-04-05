require "chef/knife"
require_relative "./saved_search_base"

class Chef
  class Knife
    class SavedSearchList < Knife
      include SavedSearchBase

      banner "knife saved search list (options)"

      def run
        format_list_for_display(Chef::DataBag.load(data_bag))
      rescue Net::HTTPServerException => e
        if e.response.code.to_i == 404
          warn "\"#{data_bag}\" data bag does not exist. No saved searches could be found."
        end
      end
    end
  end
end
