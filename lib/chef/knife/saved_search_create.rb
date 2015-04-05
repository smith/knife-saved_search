require "chef/knife"
require_relative "./saved_search_base"

class Chef
  class Knife
    class SavedSearchCreate < Knife
      include SavedSearchBase

      banner "knife saved search create NAME INDEX QUERY [DESCRIPTION] (options)"

      def run
        if name_args.length < 3 || name_args.length > 4
          show_usage
          ui.fatal("You must specify a saved search name, index, and query, with an optional description")
          exit 1
        end

        name, index, query, description = name_args

        item = Chef::DataBagItem.from_hash(
          "id" => name,
          "index" => index,
          "query" => query,
          "description" => description
        )
        item.data_bag(data_bag)
        rest.post_rest("data/#{data_bag}", item)
        msg "Created saved_search[#{name}]"
      rescue Net::HTTPServerException => e
        if e.response.code.to_i == 404
          warn "\"#{data_bag}\" data bag does not exist. Creating it."
          rest.post("data", { "name" => data_bag })
          ui.info("Created data_bag[#{data_bag}]")
          retry
        else
          raise
        end
      end
    end
  end
end
