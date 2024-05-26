module SteamAPI
  module Inventory
    class Request < SteamAPI::BaseRequest
      def initialize(user_id)
        super()

        @user_id = user_id
      end

      def query_params
        super().merge({
          l: 'russian',
          count: 5000
        })
      end

      def uri
        "https://steamcommunity.com/inventory/#{@user_id}/#{APP_ID}/2"
      end

      def response_class
        SteamAPI::Inventory::Response
      end
    end
  end
end
