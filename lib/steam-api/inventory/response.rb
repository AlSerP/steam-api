module SteamAPI
  module Inventory
    class Response < SteamAPI::BaseResponse
      attr_reader :items

      def initialize(params)
        super(params)

        if !empty? && success?
          @items = []

          @response['descriptions'].each do |item|
            @items << {
              name: item['market_name'],
              hash_name: item['market_hash_name'],
              marketable: item['marketable']
            }
          end
        end
      rescue NoMethodError => e
        raise SteamResponseError.new(e.message, params)
      end
    end
  end
end
