module V1
  class UpdateUserService
    attr_reader :current_user, :params

    def initialize(user, params)
      @params = Hash(params)
      @current_user = user
    end

    def call!
      return if current_user.nil?
      current_user.update_attributes! Hash(params)
      current_user
    end
  end
end
