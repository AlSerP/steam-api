# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

require_relative 'steam-api/version'
require_relative 'steam-api/settings'

# Custom errors

require_relative 'steam-api/errors/steam_response_error'

# Base models
require_relative 'steam-api/base_response'
require_relative 'steam-api/base_request'

# API sections
require_relative 'steam-api/item_search'
require_relative 'steam-api/item_price'
require_relative 'steam-api/inventory'

module SteamAPI
  class Error < StandardError; end
end
