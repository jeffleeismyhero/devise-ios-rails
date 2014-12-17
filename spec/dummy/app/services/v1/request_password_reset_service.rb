module V1
  class RequestPasswordResetService
    attr_reader :params, :user

    def initialize(params)
      @params = params
      @user = User.find_by_email!(@params[:email])
    end

    def call!
      user.send_reset_password_instructions
      user
    end
  end
end
