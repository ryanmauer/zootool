module Zootool
  
  # The base class for other Zootool API query classes. Simply provides
  # common functionality to simplify the API querying process.
  #
  class ZooQuery
  
    # The ZootoolApi to use for making requests.
    attr_accessor :api
  
    # Initializes the ZooQuery.
    def initialize api
      @api = api
    end
  
    # Builds a query string from a hash for use in the query URL in the form: 
    # key1=value1&key2=value2
    #
    def build_query_string hash=nil
      return '' if hash.nil?
      return (hash.to_a.map {|q| "#{q[0]}=#{q[1]}"}).join("&")
    end
  
    # Returns a hash containing the first element of the specified
    # args array or a new hash if the args array is nil or empty.
    # This is simply a convenience to simplify the API queries that
    # allow optional arguments.
    #
    def args_to_hash args
      if args.nil? || args.length < 1
        return {}
      else
        return args[0]
      end
    end
  
  end
  
end