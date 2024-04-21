module SteamAPI
  STEAM_PRICE_URI = "https://steamcommunity.com/market/priceoverview/"

  # Search app id
  APP_ID = 730
  # Currency code
  CURRENCY = 5
  # Number of search queries
  MAX_RETRIES = 5
  # Delay between search requests
  RETRY_DELAY = 2 # sec
  # Language of search queries
  ACCEPT_LANGUAGE = 'ru-RU,ru'
end
