module SteamAPI
  STEAM_PRICE_URI = "https://steamcommunity.com/market/priceoverview/"

  # Search app id
  APP_ID = ENV['STEAM_APP_ID'] || 730
  # Currency code
  CURRENCY = ENV['STEAM_CURRENCY'] || 5
  # Number of search queries
  MAX_RETRIES = ENV['STEAM_MAX_RETRIES'] || 5
  # Delay between search requests
  RETRY_DELAY = ENV['STEAM_RETRY_DELAY'] || 1.5 # sec
  # Language of search queries
  ACCEPT_LANGUAGE = ENV['STEAM_ACCEPT_LANGUAGE'] || 'ru-RU,ru'
end
