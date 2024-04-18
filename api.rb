require 'uri'
require 'net/http'
require 'json'
# require 'rest-client'

module API
  STEAM_PRICE_URI = "https://steamcommunity.com/market/priceoverview/"

  APP_ID = 730
  CURRENCY = 5

  MAX_RETRIES = 15
  RETRY_DELAY = 2 # sec
end

require_relative 'api/base_response'
require_relative 'api/base_request'

require_relative 'api/item_search'
require_relative 'api/item_price'
