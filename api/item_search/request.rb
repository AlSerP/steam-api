module API
  module ItemSearch
    class Request < API::BaseRequest
      def initialize(query)
        super()

        @query = query
      end

      def query_params
        super().merge ({
          norender: 1,
          count: API::ItemSearch::RESULT_SIZE,
          query: @query
        })
      end

      def response_class
        API::ItemSearch::Response
      end

      def uri
        "https://steamcommunity.com/market/search/render/"
      end
    end
  end
end
