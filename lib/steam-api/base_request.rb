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
      # query = to_query(query_params)
      url = URI.parse(uri)
      url.query = URI.encode_www_form(query_params)
      request = Net::HTTP::Get.new(url)
      request['Accept-Language'] = SteamAPI::ACCEPT_LANGUAGE

      retries = 0
      response = nil

      loop do
        puts "RETRY #{self} №#{retries+1}"

        response = Net::HTTP.start(url.host, url.port, use_ssl: url.scheme == 'https') { |http|
          http.request(request)
        }
        response = response_class.new(response.body)
        
        retries += 1

        # puts "EMPTY? #{response.empty?}"
        # puts "RETRIES AVIABLE? #{retries < MAX_RETRIES}"
        break unless response.empty? && retries < MAX_RETRIES
        # break if  not response.empty? || retries >= MAX_RETRIES
        
        sleep(RETRY_DELAY)
      end
      
      response
    end
  end
end
