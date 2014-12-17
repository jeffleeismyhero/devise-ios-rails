module V1
  class UnauthorizedError < Error
    def initialize
      super(message: 'Unauthorized', code: 0, status: 401)
    end
  end
end
