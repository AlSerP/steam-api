module SteamAPI
  class BaseResponse
    attr_reader :response

    def initialize(params)
      @response = params.is_a?(String) ? JSON.parse(params) : params
    end

    def success?
      @response["success"]
    end

    def empty?
      false
    end
  end
end