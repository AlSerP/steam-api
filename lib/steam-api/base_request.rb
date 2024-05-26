module SteamAPI
  class BaseRequest
    def initialize
      @app_id = APP_ID
      @currency = CURRENCY
      @language = 'russian'
    end

    def query_params
      {
        appid: @app_id,
        currency: @currency,
        market_hash_name: @item_name,
        language: @language,
        country: 'RU',
      }
    end

    def response_class
      SteamAPI::BaseResponse
    end

    def uri; end

    def to_query(params)
      params.map {|k, v| "#{k}=#{v}"}.join('&') 
    end

    def send
      url = URI.parse(uri)
      url.query = URI.encode_www_form(query_params)
      request = Net::HTTP::Get.new(url)
      request['Accept-Language'] = SteamAPI::ACCEPT_LANGUAGE

      retries = 0
      response = nil

      loop do
        response = Net::HTTP.start(url.host, url.port, use_ssl: url.scheme == 'https') { |http|
          http.request(request)
        }
        response = response_class.new(response.body)
        
        retries += 1

        sleep(RETRY_DELAY)
        break unless response.empty? && retries < MAX_RETRIES
      end
      
      response
    end
  end
end
