module V1
  class DeleteOwnAccountService
    attr_reader :current_user

    def initialize(current_user)
      @current_user = current_user
    end

    def call!
      return if current_user.nil?
      current_user.destroy!
    end
  end
end
