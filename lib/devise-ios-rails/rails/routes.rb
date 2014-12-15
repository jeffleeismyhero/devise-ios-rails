module ActionDispatch::Routing
  class Mapper
    def devise_ios_rails_for(*resources)
      options = resources.extract_options!
      options[:controllers] ||= {}
      options[:controllers] = default_controllers.merge(options[:controllers])
      devise_for(*[resources, options].flatten)
    end

    private

    def default_controllers
      {
        registrations: 'devise_ios_rails/registrations',
        passwords: 'devise_ios_rails/passwords',
      }
    end
  end
end
