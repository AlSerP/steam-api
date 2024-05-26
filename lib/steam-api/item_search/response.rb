module SteamAPI
  module ItemSearch
    class Response < SteamAPI::BaseResponse
      attr_reader :search_result, :search_result_hash
      attr_reader :results

      def initialize(params)
        super(params)
        if success?
          puts "RESPONSE COUNT #{@response["total_count"]}"
          
          if @response["total_count"] > 0
            @results = @response["results"]
            puts @results[0]["name"]
            @search_result = @results[0]["name"]
            @search_result_hash = @results[0]["hash_name"]
          end
        end
      rescue NoMethodError => e
        raise SteamResponseError.new(e.message, params)
      end

      def empty?
        @search_result.nil?
      end
    end
  end
end
