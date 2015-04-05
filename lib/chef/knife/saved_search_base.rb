class Chef
  class Knife
    module SavedSearchBase
      def self.included(includer)
        includer.class_eval do
          category "saved search"

          deps do
            require "chef/data_bag"
            require "chef/data_bag_item"
          end

          option :saved_search_data_bag,
            :short => "-D",
            :long => "--data-bag",
            :description => "Data bag to use for saved searches.",
            :default => "saved-searches"
        end
      end

      # The data bag to used for saved searches
      def data_bag
        config[:saved_search_data_bag]
      end
    end
  end
end
