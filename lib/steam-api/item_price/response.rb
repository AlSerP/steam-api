module SteamAPI
  module ItemPrice
    class Response < SteamAPI::BaseResponse
      attr_reader :lowest_price, :median_price, :volume

      def initialize(params)
        super(params)

        if !empty? && @response["success"]
          @lowest_price = @response['lowest_price']
          @median_price = @response['lowest_price']
          @volume = @response['volume']
        end
      rescue NoMethodError => e
        raise SteamResponseError.new(e.message, params)
      end

      def empty?
        @response.nil?
      end
    end
  end
end