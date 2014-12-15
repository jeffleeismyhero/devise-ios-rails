module DeviseIosRails
  class ChangePasswordService
    attr_reader :params, :current_user
    def initialize(current_user, params)
      @params = Hash(params)
      @current_user = current_user
    end

    def call!
      return if current_user.nil?
      current_user.password = snake_case_params[:password]
      current_user.password_confirmation = snake_case_params[:password_confirmation]
      current_user.save
      current_user
    end

    private

    def snake_case_params
      params.deep_transform_keys do |key|
        underscore = key.to_s.underscore
        underscore.to_sym
      end
    end
  end
end
