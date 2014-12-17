module V1
  class RegisterService
    attr_reader :params, :user

    def initialize(params)
      @params = params
      @user = User.new(@params)
    end

    def call!
      @user.save!
      @user
    end
  end
end
