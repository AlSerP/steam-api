module SteamAPI
  module ItemPrice
    class Response < SteamAPI::BaseResponse
      attr_reader :lowest_price, :median_price, :volume

      def initialize(params)
        super(params)

        begin
        if @response["success"]
          @lowest_price = @response['lowest_price']
          @median_price = @response['lowest_price']
          @volume = @response['volume']
        end
        rescue NoMethodError => e
          puts "ERROR #{e.exception} WITH #{params}"
        end
      end
    end
  end
end