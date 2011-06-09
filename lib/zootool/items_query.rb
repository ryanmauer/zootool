require 'zootool/zoo_query'

module Zootool
  
  # Performs Zootool item queries to the Zootool API. This includes queries
  # for popular items.
  #
  # Usage: You don't need to create an object of this class directly. Instead 
  # use the item method on your ZootoolApi object.
  #
  # See http://zootool.com/api/docs/items for Items API documentation.
  #
  class ItemsQuery < ZooQuery

    # Returns the info for an item with the specified uid.
    #
    # Returns a hash containing the item info.
    #
    def info(uid)
      hash = {:uid => uid}
      @api.request("items/info/?#{build_query_string(hash)}")
    end
  
    # Returns the most popular items. The time period for which to return
    # popular items may be specified via the type parameter. Valid values
    # are: all, month, week, today. If not specified (or if an invalid time
    # period is specified), it will default to all.
    #
    # Returns an array of hashes containing item info.
    # 
    def popular(type='all')
      # ensure only allowed popular types
      type = 'all' unless ['all','month','week','today'].include?(type)
      @api.request("items/popular/?type=#{type}")
    end
  
  end

end