module SteamAPI
  module ItemSearch
    class Request < SteamAPI::BaseRequest
      def initialize(query)
        super()

        @query = query
      end

      def query_params
        super().merge ({
          norender: 1,
          count: SteamAPI::ItemSearch::RESULT_SIZE,
          query: @query
        })
      end

      def response_class
        SteamAPI::ItemSearch::Response
      end

      def uri
        "https://steamcommunity.com/market/search/render/"
      end
    end
  end
end
