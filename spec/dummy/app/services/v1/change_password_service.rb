module V1
  class ChangePasswordService
    attr_reader :params, :current_user
    def initialize(current_user, params)
      @params = Hash(params)
      @current_user = current_user
    end

    def call!
      return if current_user.nil?
      current_user.attributes = params
      current_user.save!
      current_user
    end
  end
end
