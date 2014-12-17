module V1
  class ForbiddenError < Error
    def initialize
      super(message: 'Forbidden', code: 0, status: 403)
    end
  end
end
