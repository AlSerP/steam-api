module API
  module ItemPrice
    class Request < API::BaseRequest
      def initialize(item_name)
        super()

        @item_name = item_name
      end

      def query_params
        super().merge({
          market_hash_name: @item_name
        })
      end

      def uri
        "https://steamcommunity.com/market/priceoverview/"
      end

      def response_class
        API::ItemPrice::Response
      end
    end
  end
end
