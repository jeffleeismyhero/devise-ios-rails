module V1
  class LoginService
    attr_reader :params, :user

    def initialize(params)
      @params = params
      @user = User.find_by_email(@params[:email])
    end

    def call!
      if authenticated?
        user
      else
        raise UnauthorizedError
      end
    end

    private

    def authenticated?
      user.present? && user.valid_password?(params[:password])
    end
  end
end
