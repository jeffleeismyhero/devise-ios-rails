require 'rails'
require 'devise-ios-rails/engine'
require 'devise-ios-rails/rails/routes'
require 'simple_token_authentication'

module DeviseIosRails
  module Rails
    class Railtie < ::Rails::Railtie
      config.after_initialize do
        DeviseController.class_eval do
          unacceptable_forgery_methods = [
            ActionController::RequestForgeryProtection::ProtectionMethods::Exception,
          ]

          if unacceptable_forgery_methods.include?(forgery_protection_strategy)
            protect_from_forgery with: :reset_session
          end

          unless mimes_for_respond_to.include?(:json)
            new = mimes_for_respond_to.dup
            new[:json] = {}
            self.mimes_for_respond_to = new.freeze
          end
        end

        ActionController::Responder.class_eval do
          protected

          def json_resource_errors
            resource.errors
          end

          # simply render the resource even on POST instead of redirecting for ajax
          def api_behavior(error)
            if post?
              display resource, :status => :created
            # render resource instead of 204 no content
            elsif put? || delete?
              display resource, :status => :ok
            else
              head :no_content
            end
          end
        end

        SimpleTokenAuthentication::FallbackAuthenticationHandler.class_eval do
          def authenticate_entity!(controller, entity)
            controller.send("authenticate_#{entity.name_underscore}!".to_sym, force: true)
          end
        end
      end
    end
  end
end
