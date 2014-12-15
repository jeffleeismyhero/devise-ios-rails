require 'simple_token_authentication/entity'

module DeviseIosRails
  class PasswordsController < Devise::PasswordsController
    include SimpleTokenAuthentication::TokenAuthenticationHandler

    def update
      respond_to do |format|
        format.html { super }
        format.json do
          super and return if authenticate_entity_from_token!(entity).nil?

          user = DeviseIosRails::ChangePasswordService.new(
            send("current_#{resource_name}"),
            params[:user]
          ).call!

          respond_with user
        end
      end
    end

    private

    def entity
      SimpleTokenAuthentication::Entity.new(resource_class)
    end
  end
end
