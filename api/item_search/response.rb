module API
  module ItemSearch
    class Response < API::BaseResponse
      attr_reader :search_result, :search_result_hash
      attr_reader :results

      def initialize(params)
        super(params)
        puts "RESPONSE #{@response["searchdata"]["query"]}"

        begin
          if @response["success"]
            puts "RESPONSE COUNT #{@response["total_count"]}"
            
            if @response["total_count"] > 0
              @results = @response["results"]
              puts @results[0]["name"]
              @search_result = @results[0]["name"]
              @search_result_hash = @results[0]["hash_name"]
            end
          end
        rescue NoMethodError => e
          puts "ERROR #{e.exception} WITH #{params}"
        end
      end

      def empty?
        @search_result.nil?
      end
    end
  end
end
