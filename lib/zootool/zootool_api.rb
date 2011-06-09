require 'httparty'
require 'json'

module Zootool
  
  # A wrapper that provides access to the Zootool API.
  #
  class ZootoolApi
    
    # HTTP requests are made via HTTParty
    include HTTParty
    
    # The API key for your Zootool application. Set when creating a new ZootoolApi.
    attr_accessor :api_key
    
    # Initializes the ZootoolApi object for making requests. You must specify your
    # Zootool Application API key for requests to return data successfully.
    #
    # Example:
    #
    #   api = Zootool::ZootoolApi.new('your_api_key_goes_here')
    # 
    def initialize api_key
      @api_key = api_key
    end
    
    # Provides a simple way to get Zootool items and info for users.
    #
    # Returns a UsersQuery that provides methods to easily access the items and
    # other info for users. The methods of the returned UsersQuery return a
    # 
    # Example:
    #
    #   api = Zootool::ZootoolApi.new('your_api_key')
    #   user_items = api.users('rmauer').items
    #   all_items = api.users.items
    #   all_paged = api.users.items(:limit => 5, :offset => 10)
    #
    def users username=nil
      Zootool::UsersQuery.new(self,username)
    end
    
    # Provides a simple way to get a specific item by its uid. This is just
    # shorthand for the longer api.items.info method.
    #
    # Example: 
    #
    #   api = Zootool::ZootoolApi.new('apikey')
    #   item_by_uid = api.item('1kf7s')
    #
    def item uid
      self.items.info(uid)
    end
    
    # Provides a simple way to get items.
    #
    # Example:
    #
    #   api = Zootool::ZootoolApi.new('apikey')
    #   items = api.items.popular('week')
    #   item_by_uid = api.items.info('1kf7s')
    #
    def items
      Zootool::ItemsQuery.new(self)
    end
    
    # Makes a request to the specified path and returns a Hash containing
    # the result of the HTTP request.
    #
    def request(path)
      url = "#{Zootool::API_URL}#{path}&apikey=#{@api_key}"
      self.class.get(url).parsed_response
    end
    
  end
  
end