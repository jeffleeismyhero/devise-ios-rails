module V1
  class Error < StandardError
    def initialize(message: nil, code: 0, status:)
      @message = message
      @code = code
      @status = status
    end
  end
end
