module Zootool
  # The base url of the Zootool API.
  API_URL = "http://zootool.com/api/".freeze
end

require File.dirname(__FILE__) + '/zootool/zoo_query'
require File.dirname(__FILE__) + '/zootool/users_query'
require File.dirname(__FILE__) + '/zootool/items_query'
require File.dirname(__FILE__) + '/zootool/zootool_api'