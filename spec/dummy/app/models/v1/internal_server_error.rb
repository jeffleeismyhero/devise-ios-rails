module V1
  class InternalServerError < Error
    def initialize
      super(message: 'Internal server error', status: 500, code: 0)
    end
  end
end
