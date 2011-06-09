require 'zootool/zoo_query'

module Zootool
  
  # Performs User queries to the Zootool API. 
  #
  # Usage: You don't need to create an object of this class directly. Instead 
  # use the users method on your ZootoolApi object.
  #
  # See http://zootool.com/api/docs/users for Users API documentation.
  #
  class UsersQuery < ZooQuery
  
    # The username of the user for which the API should return results.
    attr_accessor :username
  
    # Initializes the UsersQuery.
    def initialize api, username
      @api = api
      @username = username
    end
  
    # Requests and returns the items for a specific user. Private items will be
    # returned if authenticated. If username is nil or empty, items for all users
    # will be returned.
    # 
    # Optional Supported Arguments: tag, offset, limit
    #
    # Returns an array of zero or more hashes where each hash contains the info
    # for an item. The hash keys (as of the current version of the API) include:
    #  - uid: the unique id of the item
    #  - title: the title of the item
    #  - url: the url of the item
    #  - added: when the item was added
    #  - type: the type of the item (page, etc.)
    #  - views: the number of views for the item (a string)
    #  - likes: the number of likes the item has received (a string)
    #  - comments: the number of comments the item has received (a string)
    #  - permalink: the url of the permalink for the item
    #  - tinyurl: a tiny url for linking to the item
    #  - thumbnail: the url of the thumbnail for the item
    #  - image: the url of the image for the item
    #  - referer: the page from which the item was captured
    #  - description: a description of the item
    #  - tags: an array of tags for the item
    #  - inthezoo: a boolean
    #  - public: a boolean indicating whether or not the item is public
    #
    def items *args
      hash = args_to_hash(args)
      hash[:username] = @username unless @username.nil? || @username.empty?
      @api.request("users/items/?#{build_query_string(hash)}")
    end
  
    # Returns info about a certain user. If username is nil or empty, the API
    # will return an error.
    #
    # Returns a hash containing the info for a user. The hash keys (as of the
    # current version of the API) include:
    #  - username: the username of the user
    #  - website: the url of the user's website
    #  - avatar: the url of the user's avatar image
    #  - profile: the url of the user's profile
    #
    def info
      hash = {:username => @username}
      @api.request("users/info/?#{build_query_string(hash)}")
    end
  
    # Returns a list of friends for a specific user. If username is nil or empty,
    # the API will return an error.
    #
    # Optional Supported Arguments: offset, limit, search
    #
    # Returns an array of hashes containing user info.
    #
    def friends *args
      hash = args_to_hash(args)
      hash[:username] = @username
      @api.request("users/friends/?#{build_query_string(hash)}")
    end
  
    # Returns a list of followers for a specific user. If username is nil or empty,
    # the API will return an error.
    #
    # Optional Supported Arguments: offset, limit, search
    #
    # Returns an array of hashes containing user info.
    #
    def followers *args
      hash = args_to_hash(args)
      hash[:username] = @username
      @api.request("users/followers/?#{build_query_string(hash)}")
    end
  
    # Returns a list of external profiles for a user. If username is nil or empty,
    # the API will return an error.
    #
    # Returns an array of hashes where each hash contains info for a user's profile
    # on an external site, including the following info: slug, url, title
    # 
    def profiles
      hash = {:username => @username}
      @api.request("users/profiles/?#{build_query_string(hash)}")
    end
  
    # Not implemented yet.
    #
    def validate
      return nil
    end
  
  end
  
end