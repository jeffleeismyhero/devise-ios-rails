module DeviseIosRails
  class RegistrationsController < Devise::RegistrationsController
    acts_as_token_authentication_handler_for User
    skip_before_filter :authenticate_user_from_token!, only: %i(new create cancel)
    def authenticate_scope!
      send(:"authenticate_#{resource_name}_from_token!")
      self.resource = send(:"current_#{resource_name}")
    end

    def after_update_path_for(resource)
      edit_user_registration_url
    end

    def update_resource(resource, params)
      resource.attributes = params
      resource.save
    end
  end
end
